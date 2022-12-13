base:
  'deputy-master-minion':
    - setup-ssh-master-keyfile
    - ensure-salt-ssh-on-master
  'minion*':
    - setup-ssh-minion-keyfile
