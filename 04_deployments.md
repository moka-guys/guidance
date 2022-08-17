# Guidelines for system and software deployments
These guidelines apply to deployments to assets that are managed by participating organisations of the LSGLH (servers and workstations).

## Deployment repositories
All deploment and configarion code _should_ be contained in a single repository.

- Viapath GSTT `https://github.com/moka-guys/deployments` 
- Viapath KCH `https://git.kingspm.uk/kingspm/capiac`

## Principles
Automated deployments using `ansible` playbooks is encouraged and should become best practice for software installation and full systems deployments.

### Access and Authorisation
All systems deployments are to be undertaken by senior staff only and in consultation with the Bioinformatics Lead(s). 

### Precedence of deployment methods
Deployment of software via containers _should_ be preferred. Other acceptable deployment methods include the use of coded and version controlled software provisioning systems (we use `ansible`).

## Best Practice
New deployments _should_ follow the **Infrastructure as Code** (IAC) paradigm. Use of manual procedures beyond initial operating system installation is discouraged and requires approval from the bioinformatics and/or ICT leads.

### Repository
All software deployment code shall be managed in private repositories and referenced in the respective SOPs. Local labs are responsible to ensure the security of the data contained within this repositories. The use of encrypted file vaults for access tokens and keys is _mandatory_ and must be ensured as part of the code review process.

### Asset Inventories
Assets are part of the ansible inventories and shall be updated upon acquisition of new workstations or server. Partition inventory items according production and/or development status.

### Deployment secrets
GIT repositories containing deployment models and secrets _must_ be private by default and require authentication to be used in autoamted deployments (cloning public repositories could require authentication as well). Authentication for protected `Github` repositories should be achieved via long-lived deployment keys. If this is not possible (eg over HTTPS), the deployer shall supply his access credentials as environment variables to the ``ansible-playbook`` command.

`ansible-playbook -i hosts playbook.yml -e "user=xxx" -e "password=yyy"`

If this is not possible, the deploy user on [git.kingspm.uk] shall be (temporarily) granted read-only repository access. Ansible roles must use the ``deploy`` users credentials as default.

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
```bash
ssh-keygen -t rsa -b 4096
```

#### Deploy keys
A read only deploy key for repositories on [git.kingspm.uk] is provided in the [https://git.kingspm.uk/KingsPM/capiac] repository. Access to this repository shall be restricted to system administrators, senior bioinformaticians and bioinformatics leads.
