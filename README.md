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

nexus: create a docker repository with activated http on port 31002(exaxtly this port because the kubernates service uses this). Enable the Docker Bearer Token Realm in Nexus Security->Realms Tab.
