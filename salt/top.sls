base:
  '*ontroller':
    - ntp.controller
    - mysql
    - rabbitmq
    - keystone
    - create_user_tenant
    - glance
    - nova
    - neutron-controller
    - horizon
  '*ompute':
    - ntp
    - mysqldb
    - nova.compute
    - neutron-compute
  '*etwork':
    - ntp
    - mysqldb
    - neutron-network

