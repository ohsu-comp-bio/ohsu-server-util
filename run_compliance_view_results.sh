export CTK_TGT_URLROOT=http://192.168.99.102:8000/
export CTK_TGT_DATASET_ID=WyJicmNhMSJd
mvn clean install ; unzip -ou dist/target/ga4gh-ctk-cli.zip -d test_directory  ; cd test_directory ; rm -r testresults/*  ; ./ctk ; cd .. ;open test_directory/testresults/192.168.99.102_8000/00001/report/html/index.html
