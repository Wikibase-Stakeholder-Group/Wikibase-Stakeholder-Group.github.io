---
title: Federation Terminology
parent: Projects
nav_order: 2
layout: default
last_modified_date: 2022-03-16
---

# Terminology for integrating and interfacing with remote data

Within the Wikibase Stakeholder Group as well as the larger Wikidata and Linked Open Data community, the term "federation" is used meaning different ways of aggregating, sharing, querying, and sometimes copying data.

To avoid misunderstanding the group has defined the following four terms, which are going to be used internally, and hopefully can clarify discussions in the wider field.

- _Federation_ — semantic web federated SPARQL queries, accessing local and remote SPARQL end points. All data remains at its original location and in its original namespaces.

- _Data Sync_ — data is exchanged in between Wikibase instances (including Wikidata) without relying on using the exact same IDs/URIs. In contrast to Federation, instead of merging data from separate locations on-demand at the time of querying, data is imported into a local Wikibase and also becomes part of the local namespace.

- _Wikidata Vocabulary_ — using the exact same property and item IDs as Wikidata. This is most useful for projects that aim to regularly exchange data with Wikidata, at some point want to integrate their data into Wikidata, or develop tools that only interact with Wikidata and its particular, community-built ontology. This would also concern other centralized Wikimedia services like Commons. Currently Wikimedia Deutschland is using "federation" for this exact use case.

- _Data Import_ — some people refer to "Federation" when importing a data set or "database" into a Wikibase, using that Wikibase's namespace. For instance, when a museum collection is transformed and uploaded to Wikidata, there is a sense that this data can now be used and queried together with all the other "databases" that have been imported into Wikidata.
