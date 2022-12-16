# File: /srv/salt/setup-ssh-master-keys.sls

private_keyfile_exists:
  file.exists:
    - name: /srv/salt/salt-ssh-key

public_keyfile_exists:
  file.exists:
    - name: /srv/salt/salt-ssh-key.pub

# create key if not exists
create_key:
  cmd.run:
    - name: 'ssh-keygen -b 2048 -t rsa -f /srv/salt/salt-ssh-key -q -N ""'
    - onfail:
      - private_keyfile_exists
      - public_keyfile_exists
