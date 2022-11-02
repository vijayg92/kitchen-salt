{% from "webserver/map.jinja" import vars with context %}

include:
  - webserver.install
  - webserver.config

{{ sls }}.webserver.service:
  service.running:
    - name: {{ vars['service'] }}
    - enabled: true
    - watch:
      - sls: webserver.install
      - sls: webserver.config
