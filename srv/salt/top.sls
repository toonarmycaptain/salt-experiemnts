# File: /srv/salt/top.sls

base:
  '*':
    - minion-checkup
  'deputy-master-minion':
    - check-job
