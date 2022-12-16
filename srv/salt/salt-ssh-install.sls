# File: /srv/salt/salt-ssh-install.sls

salt-ssh-installed:
  pkg.installed:
    - salt-ssh
