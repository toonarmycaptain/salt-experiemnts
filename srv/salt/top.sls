# File: /srv/salt/top.sls

base:
  '*':
    - ensure_important_file
