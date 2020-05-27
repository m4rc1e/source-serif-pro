mkdir -p ./ttf-fixed

ttfs=$(ls *.ttf)
for ttf in $ttfs
do
    gftools fix-vertical-metrics -at "730" $ttf;
    # gftools fix-vertical-metrics -ah "730" $ttf;
    # gftools fix-vertical-metrics -dt "-270" $ttf;
    # gftools fix-vertical-metrics -dh "-270" $ttf;
done

fixs=$(ls *.fix.ttf)
echo ls $fixs

for file in $fixs
do
    mv ${file} ./ttf-fixed/$ttf
done

