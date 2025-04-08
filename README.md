# k0rdent multi-env gitops repo blueprint

## Repo structure
```
/
├── clusters            # child clusters' manifests
│   ├── dev             
│   │   └── dev1        # dev/dev1 cluster manifest
│   ├── stage
│   └── prod
│       
├── credentials         # child clusters platform credentials
│   ├── base 
│   ├── kcm             # kcm-system namespace secrets
│   ├── dev
│   ├── stage
│   └── prod
│       
├── servicetemplates    # beach head servicetemplates
│   ├── base 
│   ├── dev
│   ├── stage
│   └── prod
│       
├── services            # beach head services configs
│   ├── cert-manager
│   │   ├── base
│   │   ├── dev
│   │   ├── stage
│   │   └── prod
│   ...    
│   ├── ingress-nginx
│   ├── cert-manager
│   ├── kof-storage
│   ├── kof-operators
│   ├── kof-mothership
│   ├── kof-collectors
│   └── dex
│       
└── management          # management cluster's apps & configs
    ├── kcm             # kcm configs
    ├── argocd          # argocd configs
    ├── dev             # dev env's kcm & argocd configs
    ├── stage
    ├── prod
    ├── env-config-appset.yaml            # per-env configs generator
    ├── servicetemplate-env-appset.yaml   # per-env servicetemplate generator
    ├── k0rdent-config-app.yaml           # argocd app for kcm configuration
    ├── argocd-config-app.yaml            # argocd app for argocd configuration
    └── sealed-secrets-app.yaml           # argocd app for sealed-secret
```

## Bootstrap k0rdent management cluster

## SSO setup (example for Okta)

### Setup OIDC for kind-based management cluster

https://docs.k0rdent.io/v0.2.0/admin/installation/auth/okta/

Okta auth app setup example:
https://developer.okta.com/blog/2021/10/08/secure-access-to-aws-eks#configure-your-okta-org

k0rdent RBAC setup
https://docs.k0rdent.io/v0.2.0/admin/access/rbac/


### Setup OIDC for argocd

https://argo-cd.readthedocs.io/en/stable/operator-manual/user-management/#existing-oidc-provider

Argocd RBAC setup documents:
https://argo-cd.readthedocs.io/en/stable/operator-manual/rbac/
https://argo-cd.readthedocs.io/en/stable/user-guide/projects/#project-roles
