---
title: "Version control guidelines"
author: "David Brawand"
date: "2019-08-12"
output:
  pdf_document:
    toc: true
    highlight: zenburn
---

# Software Version Control

All code developed at King's College Hospital, Precision Medicine, shall be put under version control according to these guidelines, ___in addition___ to trust-wide policies and versioning practices. Compliance with these guidelines does __not__ provide exemption of any sort to standard operation procedures, code of conducts and best practices currently enforced or encouraged under national, trust, departmental or group specific policies currently in place.

## Purpose
Versioning of software configuration allows tracking code changes and supports the validity of in production software stacks. The use of a version control system (VCS) allows and encourages efficient and safe collaborative development and provides tools for effective code review. Further, the use of a VCS allows monitoring of progress, diligence, and enables a full audit trail of bioinformatics software development.

## Usage

### Distributed version control

We mandate the use of the ___git___ distributed version control system (DVCS). This allows the collaborative, concurrent and independent development of new software or configurations (code).

### Repositories
All code developed in the bioinformatics group shall be stored in the main repository at [git.kingspm.uk](https://git.kingspm.uk). All code related to serivces provided by King's College Hospital should be created under the `KingsPM` organisation. For personal research or other projects which do not require access by others, please use your own namespace.

#### Ownership
Each code repository should have a designated owner and/or development lead. The owner shall have administration rights and able to add/remove contibutors to the repository. The owner also approves branch merges (after code review). If a repository does not follow the KingsPM guidance, the owner takes responsibility for any deviation thereof and ensures proper documentation.

#### Contributors
Contributors to specific projects shall be selected or approved by the project owner. External collaborators must abide by the same rules and standards established in the guidance documents in this repository.

#### Public access and licensing
All repositories should be private initially. Code that is not commercially sensitive or confidential, and which is of general interest should be published in a public repository. All code in public repositories must contain a `LICENSE` file. We encourage the use of permissive licenses such as the Apache or Mozilla licenses. Further guidance is provided [here](https://choosealicense.com/licenses/). Please review your choice with colleagues before you choose a licence for your open-source project.

For commercially sensitive software projects, or projects that cold potentially be monetised, a review by commercial services and/or the departmental leads is appropriate. This process should also inform the choice of a licensing model.

### Versioning
Production and/or validated code should be tagged with version numbers according to [semantic versioning](https://semver.org). We discourage prefixing versions numbers (eg `v1.2.3`) if it can be safely avoided. This especially applies to version tags applied to commits on the `master` branch.

Major revisions are likely not backwards compatible. They should mark revisions that undergo fundamental changes, such as major data model changes. Full revalidation is usually required. In certain cases revalidation can be limited to isolated parts of the software (and existing validation reports amended).

Minor revisions should be backwards compatible if possible. If this is not the case, a release history must be provided along with migration instructions. Verifications should be conducted on new minor revisions.

Patch revisions must be backwards compatible and be limited to fixes or minor feature adaptations. Revalidation of patch revisions should not be necessary, given sufficient test coverage or functional testing. Validation reports should be amended appropriately.

### Branching model
Contributors shall comply with the [GitFlow](https://www.atlassian.com/git/tutorials/comparing-workflows/gitflow-workflow) branching model. 

#### Validated master branch
All commits on the `master` branch shall be validated, production grade software, or appropriately tagged pre-release software (alpha,beta,pre,rc). Each commit shall be tagged with the appropriate version number using [semantic versioning](https://semver.org) (see above).

#### Release branches
Release branches are feature complete branches that undergo final code review and bug fixing. Branch names should be the anticipated version number prefixed by `release` (for example `release/v1.2.1`). No additional features should be added to release branches. Merging into the master branch must be performed/authorised by the project owner/lead. Branches merged into master shall be merged into the develop branch and deleted.

#### Develop branch
The development branch (`develop`) holds the current and previous states of development. Every commit on the development branch must be functional. Small changes or simple enhancements that are irreducible can be committed directly to this branch, however the use of feature branches is encouraged.

#### Feature branches
Feature branches should focus on the development of specific features that warrant multiple commits. These branches are mostly suitable for larger feature enhancements or a major refactoring. Please use succinct, pertinent names for feature branches and prefix the branch name with ___feature___ (eg `feature/rnaseq`). Completed features that have passed functional testing shall be merged into the development branch. 

### Commits
Commit messages ___must___ be __succinct__ and __informative__. We encourage to perform atomic commits. This means a single commit should implement a ___single___ set of changes that are ___irreducible___ (cannot be split into 2 separate functional units). A new commit should provide a ___useful___ enhancement to the codebase and must not impede the normal functioning of a software package (make it unusable).

### Code review
Systematic code review is encouraged. It should be most applicable to the merging of feature branches into the development branch.
Please use the ___pull request___ mechanism to perform code review. At least one person should review new code. Solely the project owner/lead should merge approved pull requests into the develop branch. Pull requests to the validated master branch are not permitted.

When issuing pull requests, ensure proper documentation of the newly implemented feature or code, so that the reviewers can understand the purpose thereof.

## Warnings 

### Commits with private data
Under any circumstances avoid adding private and business confidential data to your repositories. Never commit secrets and neither ephemeral keys to a repository. In case this happens, appropriate measures must be taken to invalidate or revoke the affected keys/secrets. If sensitive information about patients has been accidentally published, trust policies regarding data breaches apply. In any case, the owner of the affected repository must be notified of any data breaches.

Any code that contains private information to a remote repository must be considered compromised. This also applies to code pushed to private repositories as the service provider (for example GitHub) has full access to private repositories.

Providing a `.gitignore` file with the relevant exemptions should prevent accidental committing of secrets to any repository.

### Rebasing
Do not rebase any branches that have been pushed to the main repository. For local feature branches that do not have an upstream branch, rebasing is encouraged if development is slow or has been interrupted for a longer time. This help to add clarity to the commit graph and avoids long running feature branches which can create confusion.

## Concluding remarks
This guidance is subject to change. Suggestions for improvement should be discussed among the main stakeholders (developers and operations).
