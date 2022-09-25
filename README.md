# Zion

My humble homelab and playground

## Secrets

Secrets are passed through env variables. The following are needed. I am
injecting them using direnv and a `.envrc` filed.

```bash
export PM_API_TOKEN_SECRET="<api key>"
# single quotes matter here to escape the !
export PM_API_TOKEN_ID='<api-user>!<role>'
```


