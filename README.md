# k0rdent multi-env gitops repo blueprint

## Repo structure
```
/
├── clusters            # child clusters' kustomize overlays
│   ├── base 
│   ├── dev
│   ├── stage
│   └── prod
│       
├── credentials         # child clusters platform credentials' kustomize overlays
│   ├── base 
│   ├── dev
│   ├── stage
│   └── prod
│       
├── services            # child clusters beach head services' kustomize overlays
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
│   ├── kof-collectors
│   └── dex
│       
└── management          # management cluster's apps & configs
    ├── k0rdent
    ├── kof-operator
    ├── kof-mothership
    ├── sealed-secret
    └── argocd
```
