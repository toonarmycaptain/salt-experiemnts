# File: /srv/reactor/mod-watched-file.sls
# Modifies watched file

{% if 'change' in data and data['id'].startswith('minion') %}
modify-watched-file:
  local.cmd.run:
    - tgt: {{ data['id'] }}
    - arg:
      - echo $(date) | tee -a {{ data['path'] }}
{% endif %}
