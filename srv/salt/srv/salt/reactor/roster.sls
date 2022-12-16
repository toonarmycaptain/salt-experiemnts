# File: /srv/reactor/roster.sls
# Write minion IP to roster


# This is broken as
{% if 'return' in data and data['id'].startswith('minion') and 'cmd_|-report-ip_|-curl http://ipecho.net/plain_|-run' in data['return'] %}
write-ip:
  local.file.append:
    - tgt: 'id:deputy-master-minion'
    - tgt_type: grain
    - args:
      - path: /srv/salt/test_roster.txt  # change to ~/etc/salt/roster
      - makedirs: True # This should be sufficient
      - text: chicken #{{ data['return'] }}  # ['cmd_|-report-ip_|-curl http://ipecho.net/plain_|-run']['changes']['stdout'] # what this needs to be and how it's passed are in question
{% endif %}



### Test states ###
{% if 'return' in data and data['id'].startswith('minion') and 'cmd_|-report-ip_|-curl http://ipecho.net/plain_|-run' in data['reeturn'] %}
write-ip:
  local.file.append:
    - tgt: 'id:deputy-master-minion'
    - tgt_type: grain
    - args:
      - path: /srv/salt/test_roster.txt  # change to ~/etc/salt/roster
      - makedirs: True
      - text: chicken #{{ data['return'] }}  # ['cmd_|-report-ip_|-curl http://ipecho.net/plain_|-run']['changes']['stdout']
### Passing the path/makedirs args these ways didn't change anything:
#      - kwargs:
#        - makedirs: True
#        - text: {{ data }}
#      - args:
#        - makedirs: True
#    - name: /srv/salt/test_roster.namearg
{% endif %}



{% if data['id'].startswith('minion') %}
test-roster:
  # on deputy master minion?
  local.file.append:
    - tgt: 'id:deputy-master-minion'
    - tgt_type: grain
    - path: /srv/salt/test_reactor.txt
    - args: |
        - {{ data['return'] }}
    - makedirs: True
{% endif %}


{% if data %}
test-reactor:
  # on deputy master minion?
  local.cmd.run:
    - tgt: 'id:deputy-master-minion'
    - tgt_type: grain
    - path: /srv/salt/test_reactor.txt
    - args: |
        - {{ data['return'] }}
    - makedirs: True
{% endif %}




# File: /srv/reactor/roster.sls
# Write minion IP to roster

{% if 'return' in data and data['id'].startswith('minion') and 'cmd_|-report-ip_|-curl http://ipecho.net/plain_|-run' in data['return'] %}
write-ip:
  # on deputy master minion?
  local.file.append:
    - tgt: 'id:deputy-master-minion'
    - tgt_type: grain
    args:
#      - name: /srv/salt/test_roster.namearg
      - path: /srv/salt/test_roster.txt  # change to ~/etc/salt/roster
      - args:
        - text: {{ data['return'] }}  # ['cmd_|-report-ip_|-curl http://ipecho.net/plain_|-run']['changes']['stdout']
        - {{ data }}
{% endif %}
