export OS_USERNAME=admin
export OS_PASSWORD={{ pillar['keystone']['admin_pass'] }}
export OS_TENANT_NAME=admin
export OS_AUTH_URL=http://{{ pillar['keystone']['host_name'] }}:35357/v2.0
