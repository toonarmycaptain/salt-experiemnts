# File: /srv/reactor/accept-key.sls
# Accept key when minion named 'minion*' starts.

{% if 'act' in data and data['act'] == 'pend' and data['id'].startswith('minion') %}
accept-key:
  wheel.key.accept:
    - match: {{ data['id'] }}
{% endif %}
