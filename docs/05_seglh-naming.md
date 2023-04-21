---
title: Nomenclature
author: David Brawand
nav_order: 4
permalink: /nomenclature
custom_footer: true
last_modified_date: 2023-04-21 11:10:01
---
# Nomenclature

All Laboratories / Organisations _should_ adopt the SEGLH naming scheme or implement a derived, compatible naming
scheme to _guarantee_ interoperability.

If sample data is to be transferred to another organisation, the identifier _MUST_ carry the issuing organisation's
ODS code element.

Identifiers should be formatted to be at least partially sortable. Exceptions are deidentified (anonymised) identifiers

## NGS batch numbers

A NGS batch is defined as a set of samples that have undergone sequencing library preparation together. A batch can be
split into multiple

### Mandatory elements

A batch number conists of 2 elements that are joint into a single string.

- Batch type (an `enum`, `factor` of single value of a set of possible values, as agreed between data generators
- [laboratory] and processors [bioinformatics])

## Pan Numbers

A Pan Number identifes the applied testing scope (Regions of interest) and routing of secondary analysis results.

Pan Numbers are immutable identifiers and uniquely identify a tuple of at least the following:

- Regions of interest (e.g. BedMaker2 Panel)
- Analysis workflow (e.g. NGS pipeline)
- Secondary analysis routing (e.g. provider)

## Sample names

A sample name is an ordered tuple of identifers, joint by underscores. It can be or variable length formed by
manadatory and optional elements or identifiers.

The sample name _must_ match the following regular expression:
``

### Mandatory elements

Sample names identify a unique set of the following identifiers:

- preparation batch
- number within batch
- specimen or DNA number (including at least one seconday identifier)
- panel/routing/test number (a couple of human, and machine readable identifiers)

None of these identifiers can be undefined. If data is not available, placeholders should be used.

### Optional elements

A sample name can contain optional elements as follows:

- secondary sample/specimen identifier
- initials of biosample source
- sex (biological)
- sequencer sample count (sample sheet index)
- read number

### Implementation

A reference implementation of the parser/validator in python is available
[here](http://github.com/moka-guys/seglh-naming.git).
