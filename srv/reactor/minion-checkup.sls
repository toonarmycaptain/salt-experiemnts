# File /srv/reactor/minion-checkup.sls

# Uses salt-ssh to check on minion status.
{% if 'monitored' in data and data['ping'] == 'failed' and data['id'].startswith('minion') %}  # dummy selector
check-minion:
  local.cmd.run:
    - name: systemctl status salt-minion
