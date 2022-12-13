# File: /srv/salt/setup-ssh-minion-keyfile.sls

add_key_to_authorized_keys:
  file.append:
    - name: /srv/salt/test_keyfile.txt  # change to ~/.ssh/authorized_keys
    - sources:
      - salt://salt-ssh-key.pub
    - makedirs: True
    - require:
      - write_key_to_minion
