# File: /srv/salt/check-job.sls

checks:
  schedule.present:
    - function: state.sls
    - job_args:
      - minion-checkup
    - seconds: 15
