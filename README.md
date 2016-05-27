# ohsu-server-util
development utilities for ga4gh server

### typical use

```
# initial checkout
git clone git@github.com:ohsu-computational-biology/server.git
cd server
# move to topic branch
git checkout g2p-2.0
# get the schema project
git clone git@github.com:ohsu-computational-biology/schemas.git
cd schemas/
# topic branch
git checkout apichanges
cd ..
# get this project
git clone git@github.com:ohsu-computational-biology/ohsu-server-util.git
# build a development docker image
ohsu-server-util/build-docker.sh
# launch the docker image's bash shell
ohsu-server-util/server.sh
# # once inside docker 
# cd /server
# ohsu-server-util/setup-docker-test-data.sh
# # then run nosetests, bring up server, etc
# # run all nosetests except ours
# nosetests -e g2p -e genotype
# # run our nosetests
# nosetests  tests/datadriven/test_genotype_phenotype.py
# nosetests  tests/end_to_end/test_g2p.py
# # process schemas
#  ohsu-server-util/process-schemas.sh
```

