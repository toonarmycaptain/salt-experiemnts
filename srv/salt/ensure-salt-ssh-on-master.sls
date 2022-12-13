# File: /srv/salt/ensure-salt-ssh-on-master.sls

ensure_salt_ssh:
  pkg.managed:
    - salt-ssh
