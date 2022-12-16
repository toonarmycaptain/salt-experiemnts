# File: /srv/reactor/minion-auth.sls

{% if 'act' in data and data['act'] == 'accept' and data['id'].startswith('minion') %}
add-minion:
  local.state.single:
    - tgt: 'id:{{ data['id'] }}'
    - tgt_type: grain
    - args:
      - fun: cmd.run
      - name: curl http://ipecho.net/plain
{% endif %}
