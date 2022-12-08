# File: /etc/salt/minion.d/inotify-present.sls

inotify-present:
  pkg.installed:
    - pkgs:
      - inotify
    - require:
      - inotify_present_event
      - python3_present


inotify_present_event:
  salt.runner:
    - name: event.send
    - tag: inotify-present/ran
    - data:
        inotify-present: ran

python3_present:
  pkg.installed
    - pkgs:
      - python3
      - python3-pip
  - require:
    python3_present_event

python3_present_event:
  salt.runner:
    - name: event.send
    - tag: python3-present/ran
    - data:
        python3_present: ran
