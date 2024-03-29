---
title: Management of secrets
author: Rachel Duffin
nav_order: 6
permalink: /secrets
custom_footer: true
last_modified_date: 2023-04-21 11:10:01
---
# Guidelines for generation, use and management of secrets

These guidelines apply to secrets such as passwords, ssh keys, certificates and static and/or ephemeral authentication
tokens.

## root accounts

All compute assets running Linux, must have a root account protected by a master password and
master public key. This allows the recovery of data from these machine in exceptional circumstances. Further, machines
can be managed remotely using an automated provisioning tool such as **ansible**.

## Passwords

Each user is responsible to secure his/her own workstation. Linux workstation password policy is not enforced but
should meet the following requirements.

- Machine generated
- Consist of either randomly generated strings of characters, or passphrases
- Minimum length 8
- Contain upper and lower case letters
- Contain a number
- Contain a special character
- Change passwords at least once a year

Passwords meeting these requirements can easily be generated by an appropriate password management system.

### Storage

All passwords should be stored in an appropriate encrypted password management system. This reduces the temptation to
reuse passwords as it reduces the pressure on the user to create and remember good passwords. Some examples include
BitWarden, LastPass and DashLane, however password management systems may also be hosted locally.

#### Administrator level access passwords

As well as being stored in an appropriate password management system as above, hard copies shall be stored in a sealed
envelope in a safe place (locked away). The following people should be in possession of a physical copy of the master
list:

- The laboratory lead
- A designated representative of ICT services

Any updates to the master list must be propagated by the individual updating the list.

### Multi-factor authentication

Multi-factor authentication should be adopted where possible to add an extra layer of protection to password-protected
accounts.

### Asymmetric key pairs

Whenever possible, passwords should be replaced by key based authentication systems. This especially applies to `ssh`
based logins to internal and external servers.

User specific private keys should not leave the workstation on which they were generated unless for backup purposes. We
recommend generating public-private key pairs with the following command:

```bash
ssh-keygen -t rsa -b 4096
```

## Deploy keys

A read only deploy key for repositories on [git.kingspm.uk] is provided in the
[https://git.kingspm.uk/KingsPM/capiac](https://git.kingspm.uk/KingsPM/capiac) repository.
Access to this repository shall be restricted to system administrators, senior bioinformaticians and bioinformatics
leads.

## Access management

Sharing accounts introduces a number of risks, namely the loss of ability to audit user actions, and increased chance of
a user gaining access to unauthorised resources.

If a shared account is necessary, login credentials should be shared securely through a password management system such
as those mentioned above. To minimise risks as far as possible, it is recommended that the password is changed when any
member of staff who had access to that account leaves the team.

### Team leavers

Upon leaving a team, all access for a user should be revoked. This includes:
- Removing individual accounts and membership of any groups
- Revoking access to any shared accounts by changing passwords / MFA
