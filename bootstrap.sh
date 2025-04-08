# create the management cluster using kind
kind create cluster -n k0rdent

# install k0rdent
helm install kcm oci://ghcr.io/k0rdent/kcm/charts/kcm --version 0.2.0 -n kcm-system --create-namespace

# create namespaces
for i in argocd dev stage; do kubectl create ns "$i"; done

# install argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

# login to argocd using the port forwarding using the initial password
pass=$(argocd admin initial-password -n argocd | head -n 1)
export ARGOCD_OPTS='--port-forward --port-forward-namespace argocd'
argocd login --insecure --username admin --password "$pass" localhost:8080

# create k0rden management server argocd app-of-apps
argocd app create management-server-apps --repo https://github.com/ironreality/k0rdent-gitops --path management --dest-server https://kubernetes.default.svc

# argocd port-forward to access the web UI
# kubectl port-forward svc/argocd-server -n argocd 8080:443

# sync the apps
# before sync *-secrets please restore the sealed-secrets master key backup
# https://github.com/bitnami-labs/sealed-secrets?tab=readme-ov-file#secret-rotation
