set -e
# Duplicate existing files
mkdir -p GF_TTF
cp TTF/*.ttf GF_TTF/

# fix filename
mv GF_TTF/SourceSerifPro-BlackIt.ttf GF_TTF/SourceSerifPro-BlackItalic.ttf
mv GF_TTF/SourceSerifPro-BoldIt.ttf GF_TTF/SourceSerifPro-BoldItalic.ttf
mv GF_TTF/SourceSerifPro-ExtraLightIt.ttf GF_TTF/SourceSerifPro-ExtraLightItalic.ttf
mv GF_TTF/SourceSerifPro-It.ttf GF_TTF/SourceSerifPro-Italic.ttf
mv GF_TTF/SourceSerifPro-LightIt.ttf GF_TTF/SourceSerifPro-LightItalic.ttf
mv GF_TTF/SourceSerifPro-Semibold.ttf GF_TTF/SourceSerifPro-SemiBold.ttf
mv GF_TTF/SourceSerifPro-SemiboldIt.ttf GF_TTF/SourceSerifPro-SemiBoldItalic.ttf


FONTS=$(ls GF_TTF/*.ttf)
for font in $FONTS
do
	python fix_names.py $font
	gftools fix-fsselection $font --autofix --usetypometrics
	mv $font.fix $font
	gftools fix-vertical-metrics $font -ah 918 -at 918 -aw 1036 -dh -335 -dt -335 -dw 335 -lh 0 -lt 0
	base_filename=$(echo $font | cut -d'.' -f 1)
	mv $base_filename.fix.ttf $font
	gftools fix-nonhinting $font $font.fix
	mv $font.fix $font
done


rm GF_TTF/*gasp.ttf
