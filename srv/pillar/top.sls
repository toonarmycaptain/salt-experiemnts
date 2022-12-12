# File: /srv/pillar/top.sls

base:
  'minion*':
    - important-file-minion.sls
  '*master*':
    - important-file-master.sls
