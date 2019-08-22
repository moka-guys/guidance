---
title: "Deployments"
author: "David Brawand"
date: "2019-08-22"
output:
  pdf_document:
    toc: true
    highlight: zenburn
---

# Guidelines for system and software deployments
These guidelines apply to deployments to Kings College Hospital servers and workstations.

## Principles
Automated deployments using `ansible` playbooks is encouraged and should become best practice for software installation and full systems deployments at King's College Hospital Precision Medicine.

### Access and Authorisation
All systems deployments are to be undertaken by senior staff only and in consultation with the Bioinformatics Lead(s). 

### Precedence of deployment methods
Deployment of software via containers should be priority. Other deployment methods include the use of coded and version controlled software provisioning systems (we use `ansible`).

## Best Practice
Deployments should follow the **Infrastructure as Code** (IAC) paradigm. Use of manual procedures beyon initial operating system installation is discouraged and requires approval from the bioinformatics and/or ICT leads.

### Repository
All software deployment  code shall be managed in the `capiac` repository at [https://git.kingspm.uk]

### Asset Inventories
Assets are part of the ansible invetories and shall be updated upon acquisition of new workstations or server.

### Deployment secrets
KingsPM repositories are protected by default (cloning from public repositories requires authentication as well). The same applies to private repositories mirrored on ``github``. Authentication for github repositories should be achieved via deployment keys. If this is not possible (eg over HTTPS), the deployer shall supply his access credentials as environment variables to the ``ansible-playbook`` command.

`ansible-playbook -i hosts playbook.yml -e "kingspm_user=xxx" -e "kingspm_password=yyy"`

If this is not possible, the deploy user on [git.kingspm.uk] shall be (temporarily) granted read-only repository access. Ansible roles must use the ``deploy`` users credentials as defaults.

