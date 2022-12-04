# File: /srv/salt/minion-checkup.sls

check-alive:
  # state that checks if minion is alive, run on a schedule.
  cmd.run:
    - name: "salt 'minion*' test.version"

check-minion:
  # Checks status of minion after failed test.version
  cmd.run:
    - name: sudo salt-ssh minion* -r sudo systemctl status salt-minion
    - onfail:
      - check-alive

restart-minion:
  cmd.run:
    - name: salt-ssh minion* -r sudo systemctl restart salt-minion
    - onfail:
      - check-minion
