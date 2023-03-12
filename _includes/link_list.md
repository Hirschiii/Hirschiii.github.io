{% for link in page.links %}
- [{{ link.title }}]({{ link.url }})
{% if link.description %}  - {{ link.description }}{% endif %}
{% endfor %}
