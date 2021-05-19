---
layout: home
nav_exclude: true

---

# Wikibase Stakeholder Group

The Wikibase Stakeholder Group commissions production and maintenance of open source extensions to Wikibase, and documentation for institutions that want to operate and maintain a fully-fledged instance of Wikibase. [More…](about)
{: .fs-5 .fw-300}

---

Current and past contributors:

<ul class="list-style-none">
{% for contributor in site.github.contributors %}
  <li class="d-inline-block mr-1">
     <a href="{{ contributor.html_url }}"><img src="{{ contributor.avatar_url }}" width="32" height="32" alt="{{ contributor.login }}"/></a>
  </li>
{% endfor %}
</ul>


