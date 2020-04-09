# myjenkins

## prequesit

kubernetes server is installed see repository mfinfra

## install

run:
./installJenkins.sh
on the kubernetes server. there is no git installed but you can clone this repo from the dev-server to the share /mnt/data/repo and run it there from host kubernetes

## config

add the github credantials with id github. use your token for the password: Jenkins-Zugangsdaten-System-Globale Zugangsdaten 
github organization anlegen

nexus: create a docker repository(mydockerrepo) with activated http on port 31002(exaxtly this port because the kubernates service uses this). Enable the Docker Bearer Token Realm in Nexus Security->Realms Tab. 
check that in the ansible setup for docker the ip of the kubernetes server is added with the port from the kubernetes service for nexus. otherwise https is used instead auf http 
     dest: '/etc/docker/daemon.json'
     content: |
      {
       "insecure-registries" : ["172.30.0.0/16", "192.168.100.73:31003", "{{clientip}}:5000"]
      }
