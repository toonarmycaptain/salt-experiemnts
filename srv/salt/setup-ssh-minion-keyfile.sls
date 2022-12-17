# File: /srv/salt/setup-ssh-minion-keyfile.sls

add_key_to_authorized_keys:
  file.append:
    - name: /home/ubuntu/.ssh/authorized_keys # ~/.ssh/authorized_keys will be /root/.ssh/authorized_keys for the salt/root user
    - sources:
      - salt://salt-ssh-key.pub
    - makedirs: True
    - require:
      - write_key_to_minion
