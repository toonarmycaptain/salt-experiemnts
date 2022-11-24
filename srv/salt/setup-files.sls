# FIle: /srv/salt/setup-files.sls

# Place necessary files on minion for demo.

create-beacon:
  file.managed:
    - name: /etc/salt/minion.d/beacon.conf
    - source: salt://minion-files/beacon.conf # this did not work when the file and source was /etc/salt/minion.d/beacon.conf or salt:///etc/salt/minion.d/beacon.conf
