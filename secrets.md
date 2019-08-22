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

