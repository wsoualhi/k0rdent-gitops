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
    ├── dev             # dev env's kcm & argocd configs
    ├── stage
    ├── prod
    ├── env-config-appset.yaml            # per-env configs generator
    ├── servicetemplate-env-appset.yaml   # per-env servicetemplate generator
    ├── k0rdent-config-app.yaml           # argocd app for kcm configuration
    └── sealed-secrets-app.yaml           # argocd app for sealed-secret
```
