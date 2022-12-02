# File: /srv/salt/minion-checkup.sls

check-alive:
  # state that checks if minion is alive, run on a schedule.
  cmd.run:
    - name: "salt 'minion*' test.ping"

# These work (appropriate keys already on master and minion) when the commands are run manually, but not when run as a state.
# When run with salt it appears to not pull the right key etc from the salt
check-minion:
  # Checks status of minion after failed test.ping
  cmd.run:
    - name: sudo salt-ssh minion* -r sudo systemctl status salt-minion
    - onfail:
      - check-alive

restart-minion:
  cmd.run:
    - name: salt-ssh minion* -r sudo systemctl restart salt-minion
    - onfail:
      - check-minion
