# File: /srv/salt/ensure_important_file.sls

important_file_present:
  file.managed:
    - name: /srv/{{ grains.id }}-{{ pillar['important_file']['name'] }}
    - contents:
        - {{ pillar['important_file']['contents'] }}
