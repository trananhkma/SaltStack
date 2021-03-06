horizon_install:
  pkg.installed:
    - refresh: False
    - pkgs:
{% for pkg in salt['pillar.get']('horizon:pkgs', [])%}
      - {{ pkg }}
{% endfor %}

uninstall:
  cmd.run:
    - name: apt-get remove --purge openstack-dashboard-ubuntu-theme -y
    - require:
      - pkg: horizon_install

/etc/openstack-dashboard/local_settings.py:
  file.managed:
    - source: salt://horizon/file/local_settings.py
    - templete: jinja

edit_apache:
  cmd.run:
    - name: echo "ServerName localhost" >> /etc/apache2/apache2.conf
    - require:
      - pkg: horizon_install

{% for service in salt['pillar.get']('horizon:services', []) %}
{{ service }}:
  service.running:
    - watch:
      - file: /etc/openstack-dashboard/local_settings.py
{% endfor %}
