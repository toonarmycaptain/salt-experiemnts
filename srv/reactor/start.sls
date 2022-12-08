# File: /srv/reactor/start.sls
# Accept key when minion named 'minion*' starts.

# I would like to know why this doesn't work.
{% if 'act' in data and data['act'] == 'pend' and data['id'].startswith('minion') %}
accept_key:
    cmd.run:
      - name: 'sudo salt-key -Ay'
