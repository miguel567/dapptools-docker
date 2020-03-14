build image for docker
docker image build -t ubuntu-dapptools:1.2 .

run the docker with volume
docker run -tiv //d/dockerfiles:/root/dev ubuntu-dapptools:1.2