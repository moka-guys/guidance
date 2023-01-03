---
title: SDLC
author: David Brawand
parent: Development practices
nav_order: 1
permalink: /development_practices/sdlc
custom_footer: true
last_modified_date: 2023-01-03 19:12:47
---
# Software Development Lifecycle Framework

**Feasibility** - All software product development must begin with a feasibility and strategy alignment analysis. This study must include:

1. Alignment with current SEGLH/Viapath strategy and business objectives
2. Product development feasibility and impact on existing business operations
3. Study of 3rd party alternatives (buy software service)
4. Detailed description of potential return of investment or patient benefit

**Design** – High level concepts and designs must be reviewed with stakeholders (Bioinformaticians/Scientists/Clinicians/Managers). Approval must be obtained by the operational leads for bioinformatics. Minimum design requirements include:

1. High level system functionality diagrams describing process flows.
2. High level system architecture diagram showing both customer environments and integrations with other Health Data systems (if applicable).
3. Description of system components including individual modules and 3rd party APIs.
4. Potential cost impact on developement and production environments.
5. All of the above must be part of the final software documentation.

**Build** – Product development must execute using both industry standards (e.g. interchange formats), specific processes and procedures, and meet minimal reusability criteria (within GLH region and/or NHS).  Minimum development standards include:

1. All code development must be executed using the following git flow.
2. All merges into master/main branches must be code reviewed (via pull request).
3. All merges into development branch must yield functional/sucessfully tested software.
4. Code reviews must:
    - Ensure code requirements are met.
    - Review basic code structure and architecture.
    - Review documentation for content and structure.
5. All commits on master/main must receive a sematic versioning number (allowing alpha/beta/RC suffixes)

**Testing & Validation** - A proper testing and validation process must be followed for each product developed. Minimum standards for testing and validation include:

1. Unit tests must written for at least XX% of methods included in product processes.
2. Testing must ensure that explicit error checking is performed and documented for all input, including for size, data type, and acceptable ranges or formats (if applicable)
3. Code quality adherence using a standard linter (pep8, prettier, eslint, or similar) that validates basic syntax and method quality.
4. Code and package security validation using a 3rd party module (eg. NPM or Github vulnerability scanning).
5. Code execution impact on current system validation 
6. High volume (stress test) product execution testing. Eg. concurrent use.
7. Peer code review.
8. Final Build Master code review and approval.
9. Document in QMS.

**Release Management** – Release management practices are to be applied to all software development lifecycles as well as hardware, documentation, processes, and other components of a service. Release management focuses on strategic planning, scheduling, and controlling the movement of releases between development, staging, and production environments. Release management must follow these steps:

1. Product feature must be merged into the development branch and must pass checks for:
    a. Test Coverage
    b. Lint tests (optional but encouraged)
2. Final code review via pull request
3. Pull request submitted for master branch
4. Product owner merges code into master branch
5. Ops Lead approves deployment

**Continued development, Deprecation and Replacement/Retriement** - Software must be regularly assessed if fit for purpose and if still suitable for use in a clinical setting. The review cycle _must_ be set out on initial development/deployment and documented.

Special consideration must be taken regarding:
1. *Safety and Security* - Libraries and interpreters must be supported and without known major security flaws.
2. *Continued Development Support* - The software must be maintable and supported by designated individuals that possess the knowledge and understanding to continuously develop and maintain the software.
3. *Legacy status* - Care must be taken in avoiding excessive reliance on a single piece of software and aggregation of risks therein.

