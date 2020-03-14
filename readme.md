# Miguel's ubuntu dapptools docker!


## Commands

 - build image for docker

    docker image build -t ubuntu-dapptools:1.2 .

 

 - run the docker with volume

    docker run -tiv //d/dockerfiles:/root/dev ubuntu-dapptools:1.2

 - run this to start dapps:

    . /home/migue//.nix-profile/etc/profile.d/nix.sh
