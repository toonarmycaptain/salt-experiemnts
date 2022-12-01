# File: /srv/salt/minion-checkup.sls

# state that checks if minion is alive, run on a schedule.
check-alive:
  cmd.run:
    - name: "'minion*' test.ping"
