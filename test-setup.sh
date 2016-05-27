# copy tests/data to a docker native directory and create a soft link to it
mv tests/data tests/data-original
cp -r tests/data-original /tmp/tests-data
ln -s /tmp/tests-data tests/data
