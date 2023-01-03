---
title: Data processing
author: David Brawand
nav_order: 4
permalink: /data_processing
custom_footer: true
last_modified_date: 2023-01-03 12:34:46
---
# Data processing

## Processing infrastructure
Any data processing infrastructure procurement (CapEx or OpEx) shall follow the NHS architecure priniples and especially the [Public could first policy](https://digital.nhs.uk/about-nhs-digital/our-work/nhs-digital-architecture/principles/public-cloud-first).

### Resilience planning
All processing infrastructure must be hardened against:
- Hardware failure
- Environmental impacts
- Data loss/breach

Service-critical hardware must have suitable replacement (backup) available. Failure of principal infrastructure _should_ protected by automatic fallback mechanism (e.g. automated redeployment or replication of services) or be protected by the resilience model of third party cloud providers.

### Administration / Support
All data processing infrastructure _must_ be either 1) be administered by the provider, 2) be under a separate support contract, 3) administered by local IT support, or 4) have a designated systems administrator that ensures continued support, disaster recovery and maintenance. 

### Replacement
All procured infrastructure must have a projected life-expectance. Expiration thereof _must_ be added to local risk registers if no adequate replacement is available or planned for.

