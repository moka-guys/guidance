---
title: "SEGLH Guidance for bioinformatics developers and operations managers"
author: "David Brawand"
date: "2022-08-08"
header-includes: |
    \usepackage{fancyhdr}
    \pagestyle{fancy}
    \fancyfoot[CO,CE]{So is this}
    \fancyfoot[LE,RO]{\thepage}
abstract: This is a pandoc test . . . 
output:
  pdf_document:
    toc: true
    highlight: zenburn
---

# SE GLH Operational and Development Guidance

## Purpose
This guidance aims to set common standards and values in development and deployment of bioinformatics applications and workflows accross the South East Genomics Laboratory Hub. It also sets out to unify software development lifecycles and tooling to enhance interoperability and sets out a framework to allow collaborative development of software.

## Content
These guidance documents cover coding style, versioning, and documentation of code written in the bioinformatics groups of the London South Genomic Laboratory Hub (Guy's and St.Thomas', King's College Hospital, Royal Brompton and Harefield). Further they issue recommendations and requirements that ensure the safety, reliability and error prevention during the software lifecycle.

## Adoption
All bioinformaticians _should_ follow this guideline, implement its policies and record adoption there of in their organisations QMS, referencing version number (and commit identifier). Any change should be appropriately communicated to contributors.

*NB* This repository does not require tagged versions and ignores the standard branching model (single master branch only). Please use pull requests for submission of substantial changes.

## Revisions

| Date       | Version | Lead Author       | Comment                              | Approval      |
| ---------- | ------- | ----------------- | ------------------------------------ | ------------- |
| 2019-08-13 | NA      | David Brawand     | Initial revision                     | KCH internal  |
| 2020-01-03 | NA      | David Brawand     | Enlargement of scope to LSGLH        | GSTT internal |
| 2022-08-16 | v1      | David Brawand     | Major extension, CI guidelines, SDLC | Pending       |

\newpage