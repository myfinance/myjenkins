docker image build -t myjenkins jenkins/.
docker image build -t mykubectl kubectl/.
kubectl apply -f ./jenkins.yaml