docker stop ga4gh-jupyter; docker rm ga4gh-jupyter
docker build  -t ga4gh-jupyter  -f Dockerfile-ga4gh-jupyter .
docker run -d --name ga4gh-jupyter  -p 80:8888 -p 8000:8000 -t ga4gh-jupyter

