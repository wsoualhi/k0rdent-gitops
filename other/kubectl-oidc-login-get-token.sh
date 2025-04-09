export K8S_TOKEN=$(kubectl oidc-login get-token \
  --oidc-issuer-url=https://trial-6424061.okta.com/oauth2/ausqbdpmlgOuS1opH697 \
  --oidc-client-id=0oaqbdpjf3GOrVklP697 \
  --listen-address=127.0.0.1:8000 \
  --skip-open-browser=true \
  --oidc-extra-scope=email \
  --force-refresh | jq -r '.status.token' \
) && echo $K8S_TOKEN | jwt decode -
