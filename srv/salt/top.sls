base:
  'deputy-master-minion':
    - setup-ssh-master-keyfile
    - salt-ssh-install
  'minion*':
    - setup-ssh-minion-keyfile
    - report-ip
