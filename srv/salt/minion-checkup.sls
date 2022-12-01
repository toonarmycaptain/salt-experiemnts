# File: /srv/salt/minion-checkup.sls

# state that checks if minion is alive, run on a schedule.
check-alive:
  cmd.run:
    - name: "'minion*' test.ping"


# prototype, if works, do with salt-ssh
check-minion:
  cmd.run:
    - name: systemctl status salt-minion
    - onfail: check-alive
