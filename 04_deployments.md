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
These guidelines apply to deployments to assets that are managed by participating organisations of the LSGLH (servers and workstations).

## Principles
Automated deployments using `ansible` playbooks is encouraged and should become best practice for software installation and full systems deployments.

### Access and Authorisation
All systems deployments are to be undertaken by senior staff only and in consultation with the Bioinformatics Lead(s). 

### Precedence of deployment methods
Deployment of software via containers should be priority. Other deployment methods include the use of coded and version controlled software provisioning systems (we use `ansible`).

## Best Practice
New deployments should follow the **Infrastructure as Code** (IAC) paradigm. Use of manual procedures beyond initial operating system installation is discouraged and requires approval from the bioinformatics and/or ICT leads.

### Repository
All software deployment code shall be managed in private repositories and referenced in the respective SOPs.

### Asset Inventories
Assets are part of the ansible inventories and shall be updated upon acquisition of new workstations or server.

### Deployment secrets
KingsPM repositories are protected by default (cloning from public repositories requires authentication as well). The same applies to private repositories mirrored on ``github``. Authentication for github repositories should be achieved via deployment keys. If this is not possible (eg over HTTPS), the deployer shall supply his access credentials as environment variables to the ``ansible-playbook`` command.

`ansible-playbook -i hosts playbook.yml -e "kingspm_user=xxx" -e "kingspm_password=yyy"`

If this is not possible, the deploy user on [git.kingspm.uk] shall be (temporarily) granted read-only repository access. Ansible roles must use the ``deploy`` users credentials as default.

---
title: "Secrets"
author: "David Brawand"
date: "2019-08-14"
output:
  pdf_document:
    toc: true
    highlight: zenburn
---

# Guidelines for generation, use and management of secrets
These guidelines apply to secrets such as passwords, ssh keys, certificates and static and/or ephemeral authentication tokens.

## Management

### Storage of administrator level access passwords
All administrator level passwords are to be saved to the **password master list** (master list). This list is to be encrypted and stored on the KCH SharePoint resource. Hard copies shall be stored in a sealed envelope in a safe place (locked away). The following people should be in possession of a physical copy of the master list.

- the laboratory lead
- a designated representative of ICT services

Any updates to the master list must be propagated by the individual updating the list.

### root accounts
All compute assets running Linux, must have a root account protected by the KingPM master password as well as the master public key. This allows the recovery of data from these machine in exceptional circumstances. Further, machines can be managed remotely using an automated provisioning tool such as **ansible**.

## Requirements

### Passwords
Each user is responsible to secure his/her own workstation. Linux workstation password policy is not enforced but should meet the following requirements.

- minimum length 8
- contain upper and lower case letters
- contain a number
- contain a special character
- change passwords at least once a year

### Asymmetric key pairs
Whenever possible, passwords should be replaced by key based authentication systems. This especially applies to `ssh` based logins to internal and external servers.

User specific private keys should not leave the workstation on which they were generated unless for backup purposes. We recommend generating public-private key pairs with the following command:
```
ssh-keygen -t rsa -b 4096
```

#### Deploy keys
A read only deploy key for repositories on [git.kingspm.uk] is provided in the [https://git.kingspm.uk/KingsPM/capiac] repository. Access to this repository shall be restricted to system administrators, senior bioinformaticians and bioinformatics leads.

