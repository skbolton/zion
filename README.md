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

## Learning Resources

* [LearnLinux.tv Proxmox course](https://www.youtube.com/playlist?list=PLT98CRl2KxKHnlbYhtABg6cF50bYa8Ulo)
* [Create a proxmox cloud init template](https://austinsnerdythings.com/2021/08/30/how-to-create-a-proxmox-ubuntu-cloud-init-image/)
* [Deploy VMs with Terraform and Proxmox](https://austinsnerdythings.com/2021/09/01/how-to-deploy-vms-in-proxmox-with-terraform/)
