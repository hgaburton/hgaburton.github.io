root=$(pwd)
build=$(pwd)/build
bin=$root/bin

cd src
for f in $(ls *.html); 
do
    $bin/replace.sh $f > $build/$f
    git add $build/$f
done
