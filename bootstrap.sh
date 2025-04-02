# create the management cluster using kind
kind create cluster -n k0rdent

# install k0rdent
helm install kcm oci://ghcr.io/k0rdent/kcm/charts/kcm --version 0.2.0 -n kcm-system --create-namespace

# install argocd
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

# login to argocd using the port forwarding using the initial password
pass=$(argocd admin initial-password -n argocd)
argocd login --port-forward --insecure --username admin --password "$pass" localhost:8080

# create k0rden management server argocd app-of-apps
argocd app create management-server-apps --repo https://github.com/ironreality/k0rdent-gitops --path management --dest-server https://kubernetes.default.svc
