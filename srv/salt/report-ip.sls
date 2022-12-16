# File: /srv/salt/report-ip.sls
# Report minion's public IP

report-ip:
  cmd.run:
    - name: curl http://ipecho.net/plain
