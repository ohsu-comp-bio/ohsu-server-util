echo -n "Checking if ga4gh already running... "
if docker ps -a | grep ga4g
then
    echo "Looks like ga4gh already exists. Starting bash script in running image."
    docker start ga4gh
    docker  exec  -it  ga4gh bash  
    exit 0
fi

echo "Looks like ga4gh not  started. Starting docker image."
docker run --name ga4gh  -v $(pwd):/server -p 8000:8000  -it  server-python-java  bash
