---
title: Developers Handbook
author: David Brawand
parent: Development practices
nav_order: 2
permalink: /development_practices/developers_handbook
custom_footer: true
last_modified_date: 2023-01-03 19:12:47
---
# Developers Handbook

This section extends the SLDC and details working practicies that ensure *quality*, *safety*, *reproducibility*, and *resilience* of any software developed and/or deployed by bioinformaticians of the SE GLH and associated groups or organisations.

## Software stack

Every bioinformatics developer should select the most appropraite tool/programming language for the project and weigh this against the general availability of expertise in this given technology stack within the SEGLH and the wider bioinformatics network.

### Recommendations

The following software stacks are recommended as first choice in most bioinformatics use cases. Other languages and or frameworks can be used if enough knowledge exists within bioinformatics teams to maintain and continuously develop software written in this language or framework.

#### General purpose scripting language

- `python` 3.7 or higher (always consider deployment environment and version compatibility)
- `bash` or other POSIX compliant shell scripting.
- `awk`

#### Server-side

- `python` (`django` or `flask`)
- `node.js` (`express`)

#### Client-side languages and frameworks

- `html5`
- `css3` (`materialUI`, `bootstrap`)
- `javascript` (or `typescript`)

### Chosing a programming language

Generally it is *recommended* to use `python` as scripting language wherever possible to enable and facilitate collaboration within the bioinformatics network.

Preference should be given to languages and practices that reduce the risk of error. For example, the use of strongly typed languages or the use of type annotations where possible. Further consideration must be given to the ability to code-review in a timely manner.

## Style

1. Refer to the Google Style Guides included in this repository.
2. Use a code linter (eg pylint for python) and follow the respective language's best practices for coding style.
3. Spaces over Tabs for indentation (both are acceptable). Configure your editor appropriately and take care not to change indetation characters in projects that are not in your ownership.

Code style for the de facto standard laguage for bioinformatics, python3+, should reflect the recommendations from PEP8.

## Documentation

All software must be appropriately documented, so that it allows use and reuse by 3rd parties with reasonable effort.

Each software repository must at least contain a *README* file written in markdown that describes:

- Purpose
- Usage
- Inputs and outputs

### Comments and docstrings

Docstrings and comments are string literals that are ignored by interpreters/compilers of that language that support them. Both *should* be used in the source code and code review should ensure if those are necessary, useful or redundant.

Docstrings (python) decribe the purpose of modules, functions, classes and methods.

Comments should claridy the rationale behind the implementation and/or provide information if code deviates from best practice. Comments should be sparse. It is not necessary to explain third party functions or modules if they have their own complete documentation (avoid redundancy).

## Software Version Control

All code developed at the SEGLH, *must* be put under version control according to these guidelines, *in addition* to trust-wide policies and versioning practices. Compliance with these guidelines does *not* provide exemption of any sort to standard operation procedures, code of conducts and best practices currently enforced or encouraged under national, trust, departmental or group specific policies.

### Purpose

Versioning of software configuration allows tracking code changes and supports the validity of in production software stacks. The use of a version control system (VCS) allows and encourages efficient and safe collaborative development and provides tools for effective code review. Further, the use of a VCS allows monitoring of progress, diligence, and enables a full audit trail of bioinformatics software development.

### Usage

Most version control systems are not inherently prescriptive in their workflows. This section sets out standard practices that *must* be followed by all bioinformatics scientist engaging in software development to prevent issues as a result of diverging version control practices.

#### Distributed version control

We *must* use the `git` distributed version control system (DVCS). This allows the collaborative, concurrent and independent development of new software or configurations (code).

### Repositories

All code developed in the SEGLH bioinformatics groups shall be stored in the main repository at [git.kingspm.uk](https://git.kingspm.uk) (TO BE CHANGED) if it within the scope of collaborative develpment within the SEGLH.

Code and applications that are site specific and non-transferrable can be stored in the respective local code repositories. All code related to services provided by a specific SEGLH laboratory/site should be created under their respective organisation or the ``SEGLH`` organisation. For personal research or other projects which do not require access by others, please use your own namespace.

#### Ownership

Each code repository should have a designated owner and/or development lead. The owner shall have administration rights and able to add/remove contibutors to the repository. The owner *should* be the preferred approver of branch merges.

If a repository does not follow these recommendation, the owner *must* ensure proper documentation of the deviation and ensure visibility/accessibility across the bioinformatics group.

#### Contributors

Contributors to specific projects shall be selected or approved by the project owner. External collaborators must abide by the same rules and standards established in the guidance documents in this repository.

#### Deploy keys

If a repository requires read-only access for deployments, it is mandatory to use the KingsPM deploy key from the [http://git.kingspm.uk/KingsPM/capiac] repository. Access to this repo shall be restricted to senior staff, system administrators, and bioinformatics leads.

#### Public access and licensing

All repositories should be private initially. Code that is not commercially sensitive or confidential, and which is of general interest should be published in a public repository. All code in public repositories must contain a `LICENSE` file. We encourage the use of permissive licenses such as the Apache or Mozilla licenses. Further guidance is provided [here](https://choosealicense.com/licenses/). Please review your choice with colleagues before you choose a licence for your open-source project.

For commercially sensitive software projects, or projects that cold potentially be monetised, a review by commercial services and/or the departmental leads is appropriate. This process should also inform the choice of a licensing model.

### Branching model

Contributors shall comply with the [GitFlow](https://www.atlassian.com/git/tutorials/comparing-workflows/gitflow-workflow) branching model. It is no longer recommended to use branches as means to designate releases that enter production; use version tags instead.

As per GIT-flow conventions the following branch names are permitted:

- `main` or `master` - Production level code
- `hotfix/XXX` - patches, to be merged into `main` and `develop`
- `release/XXX` - pre-validation, pre-release software
- `develop` - active development (commits *must* be functional)
- `feature/XXX` - feature development/implementation

#### Validated main/master branch

All commits on the `master` or `main` branch *shall* be validated, and *must* be production grade software or appropriately tagged pre-release software (alpha,beta,pre,rc). Each commit *must* be tagged with the appropriate version number using [semantic versioning](https://semver.org) if it enters production (see above).

#### Release branches

Release branches are feature complete branches that undergo final code review and bug fixing. Branch names should be the anticipated version number prefixed by `release` (for example `release/v1.2.1`). No additional features should be added to release branches. Merging into the master branch must be performed/authorised by the project owner/lead. Branches merged into master shall be merged into the develop branch and deleted.

#### Develop branch

The development branch (`develop`) holds the current and previous states of development. Every commit on the development branch *must* be functional. Small changes or simple enhancements that are irreducible can be committed directly to this branch, however the use of feature branches is encouraged.

#### Feature branches

Feature branches should focus on the development of specific features that warrant multiple commits. These branches are mostly suitable for larger feature enhancements or a major refactoring. Please use succinct, pertinent names for feature branches and prefix the branch name with ___feature___ (eg `feature/rnaseq`). Completed features that have passed functional testing shall be merged into the development branch.

### Commits

Commit messages *must* be *succinct* and *informative*. Commits *should* be atomic. This means a single commit should implement a *single* set of changes that are *irreducible* (cannot be split into 2 separate functional units). A new commit should provide a *useful* enhancement to the codebase and must not impede the normal functioning of a software package (make it unusable). Automatic testing can provide such guarantees (see below).

#### Initial commit

Ensure that each software project commences with an initial commit containing a *README* file outlining the intent and, if applicable, a *LICENCE* file. Preferred licences for software that is to be made available to the puclic realm are Apache 2.0, NASA or GPLv2. Always, ensure the licensing complies with local regulations and policies.

### Versioning

Production and/or validated code *should* be tagged with version numbers according to [semantic versioning](https://semver.org). Prefixing versions numbers (eg `v1.2.3`) is *encouraged*.

__Major__ revisions are by definition *not* backwards compatible. They should mark revisions that undergo fundamental changes, such as major data model changes. Full revalidation is usually required. In certain cases revalidation can be limited to isolated parts of the software (and existing validation reports amended).

__Minor__ revisions are feature enhancements and *can* be backwards compatible. If this is not the case, a release history must be provided along with migration instructions. Verifications *should* be conducted on new minor revisions.

__Patch__ revisions must be backwards compatible and be limited to fixes or minor feature adaptations. Revalidation of patch revisions should not be necessary, given sufficient test coverage or functional testing. Validation reports should be amended appropriately.

#### Release tagging

Each commit entering production *must* be tagged using semantic versioning as outlined above. This can be achieved using `git tag` and `git push --tags` to register the set tags on the main repository (usually on GitHub). Be aware that tags are mutable and that they are not ideal for tracing versions through a proessing workflow. No records of changed tags are inherently kept by the `git` DVCS. Therefore *always* register the commit hash alongside the version number to ensure full traceability.

### Code review

Systematic code review is encouraged. It should be most applicable to the merging of feature branches into the development branch.
Please use the ___pull request___ mechanism to perform code review. At least one person should review new code. Solely the project owner/lead should merge approved pull requests into the develop branch. Pull requests to the validated master branch are not permitted.

When issuing pull requests, ensure proper documentation of the newly implemented feature or code, so that the reviewers can understand the purpose thereof.

### Continuous integration

All new repositories *must* follow principles of Continuous Integration. Existing software, and especially mission critical software *should* implement CI over time.

Every developer should be familair with the following principles of Continuous Integration.

- All code should be contained in a single source repository
- Always automate builds (or the creation of a stable runtime environment)
- Include syntax checking and unit testing within the build routine
- Test and/or build scripts *must* run successfully on the `develop` branch
- Make it easy for anyone to get the latest executable version (if applicable)
- Push commits often to ensure that everyone can see what’s happening

Build, syntax and style checking, and test suites *should* run on a continuous integration platform on push of a commit to `main`, `develop` or `release/**` branches. GitHub Actions provides a simple CI platform, which is the preferred choice.

#### Build

Compiled software *must* always come with a build script and instructions. The build process *must* be reproducible in a predefined enviroment and *could* be written as a `Dockerfile`. It is generally good practice to include a `Dockerfile` to provide a stable runtime environment.

#### Check

All interpreted language code (e.g. Python) *should* follow an agreed code style. Similarly all new repositories that enter production *must* integrate syntax checking to avoid deployments of non-functional software. The preferred choice for style and syntax checking is `flake8`, or alternatively `pylint`.

If using GitHub actions, this template implements above recommendations for a `python` project:

```yaml
name: Name of python package
on:
  push:
    branches:
      - main
      - 'release/**'
      - develop
jobs:
  build:
    runs-on: ubuntu-latest
    strategy:
      matrix:
        python-version: ["3.7", "3.10"]
    steps:
      - uses: actions/checkout@v3
      - name: Set up Python ${{ matrix.python-version }}
        uses: actions/setup-python@v4
        with:
          python-version: ${{ matrix.python-version }}
      - name: Install dependencies
        run: |
          python -m pip install --upgrade pip
          pip install flake8 pytest
          if [ -f requirements.txt ]; then pip install -r requirements.txt; fi
      - name: Lint with flake8
        run: |
          # check Python syntax errors or undefined names
          flake8 . --count --select=E9,F63,F7,F82 --show-source --statistics
          # exit-zero treats all errors as warnings
          flake8 . --count --exit-zero --max-complexity=10 --max-line-length=127 --statistics
      - name: Test with pytest
        run: |
          pytest -v
```

#### Test

All new repositories *should* contain at least a basic test suite, *except* for repositories that contain exclusively research or other code for ad-hoc use. All new software entering production *must* include a test suite. Shared libraries *should* have test coverage of 80% or greater.

#### Branch protection

Any software repository containing a test suite *must* be configured to protect production branches from merges of test failing commits. If this is impractical, ensure that merge operations can only be performed by senior staff. Code reviews should be enforced.

### Continuous Delivery or Deployment

Continuous delivery is not a requirement and not recommended within the current regulatory and governance environments. However, deployments should be automated to a large degree using a self-documenting configuration and deployment management system (e.g. Ansible) and/or contain sufficient documentation to enable reproducible deployments. Always document deployment of production code within QMS, referencing the version/commit, deployment process and checks performed.

## Cautionary mentions

### Commits with private data

Under any circumstances avoid adding private and business confidential data to your repositories. Never commit secrets and neither ephemeral keys to a repository. In case this happens, appropriate measures must be taken to invalidate or revoke the affected keys/secrets *immediately*. If sensitive information about patients has been accidentally published, trust policies regarding data breaches apply. In any case, the owner of the affected repository must be notified of any data breaches.

Any code that contains private information to a remote repository must be considered compromised. This also applies to code pushed to private repositories as the service provider (for example GitHub) has full access to private repositories.

Providing a `.gitignore` file with the relevant exemptions should prevent accidental committing of secrets to any repository.

Take extra care when handling repositories with encrypted vaults (e.g. ansible deployments). Always ensure that the vaults are in an encrypted state before creating commits or pushing them to the public realm (e.g. GitHub).

### Rebasing

Do not rebase any branches that have been pushed to the main repository. For local feature branches that do not have an upstream branch, rebasing is encouraged if development is slow or has been interrupted for a longer time. This help to add clarity to the commit graph and avoids long running feature branches which can create confusion.

## Deviations

Any software or code whose lifecycle deviates from this guidance *must* be flagged as such. This especially applies to variations of agreed branching rules. In this case prefix the repository `README` with a warning similar to the following:

> WARNING: This repository does not follow standard developers guidance as of [VERSION].
> [Describe deviation from policy]
