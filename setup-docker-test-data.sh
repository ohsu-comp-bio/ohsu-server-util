# copy tests/data to a docker native directory and create a soft link to it
mv tests/data tests/data-original
cp -r tests/data-original ~/tests-data
ln -s ~/tests-data tests/data
