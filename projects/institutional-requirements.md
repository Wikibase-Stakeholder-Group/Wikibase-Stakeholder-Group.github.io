---
title: Institutional requirements
parent: Projects
nav_order: 1
layout: default
last_modified_date: 2021-11-05
---



# Summary of institutional requirements for self-deployed Wikibase usage
{: .no_toc }

Members of the Wikibase Stakeholder Group are already using or are in the process of releasing self-hosted instances of Wikibase for mission-critical tasks. **Wikimedia Deutschland asked the group to summarize challenges that members faced in the operation of Wikibase.**

The group defined 5 major areas where Wikimedia Deutschland could improve the existing Docker distribution of Wikibase to help further institutional adoption. Each area contains concrete recommendations that were ranked by the group's members for possible impact. A score of "5" indicates an improvement that the members felt would provide the greatest impact; at the other end of the scale, a score of "1" indicates a feature which would be nice to have, but was not determined by members to be as pressing as higher-ranked issues.

This document was officially handed over to Wikimedia Deutschland Nov 5, 2021.


<details markdown="block">

<summary>Table of contents</summary>
{: .text-delta }

1. TOC
{:toc }

</details>



----

## Area 1: Deployment

### Automatic maintenance processes and updating cascades should work out of the box
`Score: 4`

**Issue:** The default setup of Wikibase requires manual work and entering values into the database to enable the regular execution of maintenance scripts and to signal updates across the site. For instance, if an entity is renamed, the changed name is not reflected in other places where this entity is referenced, including other entities and wikipages.

**Mitigation:** There is no scenario in which it is undesirable to have the maintenance and update signaling work, it should be ready to use without additional configuration.

### SiteLinks should work out of the box
`Score: 3`

**Issue:** SiteLinks represent an important connection between wiki pages and Wikibase items, and make data available for templating and Lua scripting.

**Mitigation:** Wikibase should ship with a working SiteLink configuration.

### Provide documentation, a checklist, or similar instructions for institutions that cannot run Docker
`Score: 2`

**Issue:** Security or other policies in some environments prevent potential users from running Docker. (This is not due to lack of education about Docker in general.)

**Mitigation:** Even if there is no official support for running a Wikibase instance not based on Docker, deployment instructions, maybe based on the existing Dockerfiles, would be helpful.

## Area 2: Customization

### Introduce customization options for the Query Service UI

`Score: 5` <span class="label label-yellow">highest ranked issue</span>

**Issue:** The Wikidata Query GUI currently is shipped as a single page web application (SPA) and hence offers no possibility for customization via Docker environment variables.

**Mitigation:** Offer customization via Docker environment variables. (Rhizome has [published annotated changes to the query GUI](https://github.com/rhizomedotorg/artbase-query-gui/commit/29ce17b225a3fb9d9bcd16896778f94495fdf9c9) showing the most important areas of customiation: support for rendering LocalMedia, custom RDF prefixes, branding, and UI-related bugfixes.)

### Allow better customization of Mediawiki, Wikibase, and RDF URLs

`Score: 2`

**Issue:** Any changes in the default URL setup of Mediawiki/Wikibase, such as via `$wgArticlePath`, `$wgPathInfo`, or in general any setup in which Wikibase would not be accessible via a URL in the format `http[s]://<hostname>/wiki/<page>` will break data export to Blazegraph. This prevents deployments in certain environments (where services are supposed to appear below a certain path), as well as providing users with the shortest path possible (in which case the `wiki` portion is redundant.)

**Mitigation:** Rework the "RDF muncher" in `wdqs-updater` to accept URLs from the Wikibase deployment.

## Area 3: Developer Experience

### Make deployments easily portable
`Score: 3`

**Issue:** It is very difficult to use the Docker deployment in a way that most developers are used to: exploring and piloting configuration options locally (for instance, on a developer's laptop) before deploying to the live system. Mediawiki and Wikibase expecting globally absolute URLs in many places _outside_ configuration files (such as the "sites table" in the database) force developers to keep and manually keep in sync at least two deployments, and make it very hard to locally execute tests with real data.

**Mitigation:** Remove Mediawiki's, Wikibase's, or core extensions' reliance on globally absolute URLs. In configuration, clearly separate RDF URL prefixes and URLs required for browser or API access.

### Establish clear and discoverable names for code repositories and project management boards
`Score: 3`

**Issue:** Repositories on GitHub and project boards on Wikimedia's Phabricator instance are named to represent internal Wikimedia processes, such as "wikibase-release-pipeline", or "Wikibase Release Strategy" — it is unclear where to file bugs or ask for help. Phabricator tickets in many cases don't include adequate context and descriptions and seem to serve as internal reminders for deeply embedded developers.

**Mitigation:** Use established naming conventions for repositories and project boards, contextualize Phabricator tickets better.


## Area 4: Documentation

### The `wdqs` (Blazegraph) Docker image needs cleanup & documentation
`Score: 3`

**Issue:** The `wdqs` Docker image contains undocumented software and configuration files that seem to be unused. Exploring the Docker image for customization or community-level documentation is very difficult.

**Mitigation:** Clean up the image and provide initial documentation.

### Establish clear separation of documentation and community channels for Wikidata and Wikibase
`Score: 2`

**Issue:** In events, documentation, chat channels, and on a personal level when talking to stakeholders, users or Wikimedia representatives, borders between Wikidata (as in *the global project*) and Wikibase (as in *the software run independently of Wikidata*) are often blurry. This oftentimes leads to well-meaning but factually wrong or impractical advice circulating, and to a confusion about what the differences between the two projects actually are.

**Mitigation:** Clearly separate community spaces specific to Wikidata and Wikibase, establish a culture of referring people to the right spaces.

### Do not recommend using or create technical solutions based on "magic properties"
`Score: 2`

**Issue:** "Magic properties" are a colloquial name for Wikidata properties that over the development of the project through community action have evolved to add outside functionality to Wikidata. (One example is the "constraints" set of properties that is used by bots to check items for formal validity.) Reproducing such processes in local Wikibases makes little sense, and adds another opaque mode of configuration, while preventing the establishment of cleaner technical solutions being developed.

**Mitigation:** Do not recommend using or create technical solutions based on "magic properties," instead help thinking about clean technical solutions.

### Provide a list of use-cases and chosen technical solutions
`Score: 2`

**Issue:** For many challenges institutions are facing with Wikibase, existing Wikibase or Mediawiki extensions or configuration options could provide solutions. It is difficult to gain an overview of what is already possible, and what solutions were chosen in existing deployments.

**Mitigation:** Document generally applicable solutions to common issues, and make clear statements about where the foundational design of Wikibase (and Mediawiki) would make it particularly difficult to solve an issue.

## Area 5: Features

### Offer an OpenRefine reconciliation endpoint in Wikibase, removing the need for an external wrapper
`Score: 4` <span class="label label-yellow">second highest ranked issue</span>

**Issue:** The OpenRefine project has developed a reconciliation endpoint for Wikibase that provides incredible added value, but is currently not part of the Docker distribution, and difficult to set up.

**Mitigation:** Add the OpenRefine reconciliation endpoint to the Docker distribution.

### Improve API performance for data ingest
`Score: 3`

**Issue:** Institutions that want to move their data into Wikibase in a clean way only have the option of using the API. The API's performance is too slow to import moderately sized datasets.

**Mitigation:** Improve API performance or provide a tool to import from local files.

### Simplify Blazegraph updating process
`Score: 3`

**Issue:** The process that is updating Blazegraph when changes in Wikibase are detected is performing reformatting, validation, and chunking actions that are required for a deployment the size of Wikidata, but are the cause of much confusion and error for smaller-sized Wikibases.

**Mitigation:** Simplify the process by removing the need to reformat, validate and chunk data; for instance by Wikibase offering an API endpoint that already delivers data in the format Blazegraph expects.

### Improve CirrusSearch for mixed Mediawiki + Wikibase usage.
`Score: 2`

**Issue:** When using both Mediawiki's and Wikibase's capabilities in a single deployment (which probably should be assumed as default, otherwise the Docker setup would contain a separate Mediawiki), it is difficult to offer site visitors reasonable search.

**Mitigation:** Perhaps separate Wikibase and Mediawiki search, allow constraining to defined namespaces, respect `DISPLAYTITLE`s.

### Port the Wikibase Query Service to support other triple stores.
`Score: 1` <span class="label label-yellow">lowest ranked issue</span>

**Issue:** Wikibase is currently tied to Blazegraph, a triple store that is at risk of being abandoned by its original developers. It is possible to import the RDF generated by Wikibase into other standard triple stores. However, the WBQS is closely tied to specific Blazegraph functionality, which makes supporting other triple stores difficult if not impossible. 

**Mitigation:** Standardize the WBQS to support standard (SPARQL 1.1) triple stores.

---


<img src="/assets/logos/cs+s.png" alt="CS&amp;S" style="height: 1.8em;"> <img src="/assets/logos/dcmi.svg" alt="Dublic Core Metadata Initiative" style="height: 2.5em;"> <img src="/assets/logos/enslaved-org.svg" alt="enslaved.org" style="height: 2em;"> <img src="/assets/logos/GeneWikidata-logo-en.png" alt="Gene Wiki" style="height: 2.5em;"> <img src="/assets/logos/miceliorgb.png" alt="micel.io" style="height: 3em;"> <img src="/assets/logos/openrefine.svg" alt="CS&amp;S" style="height: 1.8em;"> <img src="/assets/logos/The_QA_Company.png" alt="The QA Company" style="height: 2.5em;"> <img src="/assets/logos/rhizome.svg" alt="Rhizome" style="height: 1.6em;"> <img src="/assets/logos/TIB_Logo_RGB_65px.png" alt="TIB Hannover" style="height: 3.2em;"> <img src="/assets/logos/ub-mannheim.png" alt="UB Mannheim" style="height: 2.5em;"> <img src="/assets/logos/weso.png" alt="WESO Research Group" style="height: 2em;"> <img src="/assets/logos/wikibase-consultancy.svg" alt="Wikibase Consultancy" style="height: 2.3em;">
{: .logodeck }


