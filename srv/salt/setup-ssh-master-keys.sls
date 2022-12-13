# File: setup-ssh-master-keys.sls

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


copy_private_key_to_master


# Ensure key map file exists
key_yaml_created:
  file.prepend:
    - name: /srv/salt/public.yaml
    - text: 'key: |'


add_key_to_map_file:
  file.append:
    - name: /srv/salt/public.yaml
    - source: /srv/salt/salt-ssh-key.pub
    - require:
      - key_yaml_created
      - create_key
