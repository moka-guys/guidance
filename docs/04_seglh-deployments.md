---
title: Deployments
author: David Brawand
nav_order: 2
permalink: /deployments
custom_footer: true
last_modified_date: 2023-01-03 13:29:31
---
# System and software deployments
These guidelines apply to deployments to assets that are managed by participating organisations of the LSGLH (servers 
and workstations).

## Deployment repositories
All deploment and configarion code _should_ be contained in a single repository.

- Synnovis GSTT - [https://github.com/moka-guys/deployments](https://github.com/moka-guys/deployments)
- Synnovis KCH - [https://git.kingspm.uk/kingspm/capiac](https://git.kingspm.uk/kingspm/capiac)

## Principles
Automated deployments using `ansible` playbooks is encouraged and should become best practice for software installation 
and full systems deployments.

### Access and Authorisation
All systems deployments are to be undertaken by senior staff only and in consultation with the Bioinformatics Lead(s). 

### Precedence of deployment methods
Deployment of software via containers _should_ be preferred. Other acceptable deployment methods include the use of 
coded and version controlled software provisioning systems (we use `ansible`).

## Best Practice
New deployments _should_ follow the **Infrastructure as Code** (IAC) paradigm. Use of manual procedures beyond initial 
operating system installation is discouraged and requires approval from the bioinformatics and/or ICT leads.

### Repository
All software deployment code shall be managed in private repositories and referenced in the respective SOPs. Local labs 
are responsible to ensure the security of the data contained within this repositories. The use of encrypted file vaults 
for access tokens and keys is _mandatory_ and must be ensured as part of the code review process.

### Asset Inventories
Assets are part of the ansible inventories and shall be updated upon acquisition of new workstations or server. 
Partition inventory items according production and/or development status.

### Deployment secrets
GIT repositories containing deployment models and secrets _must_ be private by default and require authentication to be 
used in autoamted deployments (cloning public repositories could require authentication as well). Authentication for 
protected `Github` repositories should be achieved via long-lived deployment keys. If this is not possible (eg over 
HTTPS), the deployer shall supply his access credentials as environment variables to the ``ansible-playbook`` command.

`ansible-playbook -i hosts playbook.yml -e "user=xxx" -e "password=yyy"`

If this is not possible, the deploy user on [git.kingspm.uk] shall be (temporarily) granted read-only repository 
access. Ansible roles must use the ``deploy`` users credentials as default.

