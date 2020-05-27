statics=$(ls *.ttf)

for file in $statics; do
    echo "fix vertical metrics in " ${file}
    gftools fix-vertical-metrics -at "730" ${file};
    gftools fix-vertical-metrics -ah "730" ${file};

    echo "mv files to ttf" ${file}
    # changing name from .fix.ttf to .ttf
    fixedFile=${file/".ttf"/"-*.fix.ttf"}
    cp ${fixedFile} ${file}
    rm -rf ${fixedFile};
done

# do
#     gftools fix-vertical-metrics -dt "-270" $ttf;
#     # gftools fix-vertical-metrics -dh "-270" $ttf;
# done
