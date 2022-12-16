# File: /srv/reactor/roster.sls
# Write minion IP to roster

# currently user key in roster is ubuntu - this hardcoding probably needs to change, but using root with salt-ssh has not been tested.
# NB ssh key location is hardcoded.

{% if 'return' in data and data['id'].startswith('minion') and 'cmd_|-report-ip_|-curl http://ipecho.net/plain_|-run' in data['return'] %}
write-ip:
  local.state.single:
    - tgt: 'id:deputy-master-minion'
    - tgt_type: grain
    - args:
      - fun: file.append
      - name: /srv/salt/test_roster.txt
      - text: "{{ data['id'] }}:\n  host: {{ data['return']['cmd_|-report-ip_|-curl http://ipecho.net/plain_|-run']['changes']['stdout'] }}\n  user: ubuntu\n  priv: /srv/salt/salt-ssh-key  \n  sudo: True\n"
{% endif %}
