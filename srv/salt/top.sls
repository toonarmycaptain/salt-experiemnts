# File: /srv/salt/top.sls

base:
  'minion*':
    - setup-files
