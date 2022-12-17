# File: /srv/reactor/minion-auth.sls

# File: /srv/reactor/minion-auth.sls

{% if data.get('act') == 'accept' and data['id'].startswith('minion') %}
add_key_to_authorized_keys:
  local.state.single:
    - tgt: id:{{ data['id'] }}
    - tgt_type: grain
    - args:
      - fun: file.append
      - name: /home/ubuntu/.ssh/authorized_keys # ~/.ssh/authorized_keys will be /root/.ssh/authorized_keys for the salt/root user
      - source: salt://salt-ssh-key.pub
      - queue: True
add-minion:
  local.state.single:
    - tgt: id:{{ data['id'] }}
    - tgt_type: grain
    - args:
      - fun: cmd.run
      - name: curl http://ipecho.net/plain
      - queue: True
{% endif %}

# NB note when multiple states used, need to pass queue: True or they will compete for the same process and only one will complete.
