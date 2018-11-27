mariadb-server:
 pkg.installed

mariadb-client:
 pkg.installed

#echo "CREATE DATABASE students;" | sudo mariadb -u root:
# cmd.run

#/tmp/createuser.sql:
#  file.managed:
#    - source: salt://mariadb/createuser.sql


'cat /tmp/createuser.sql|mariadb -u root':
  cmd.run:
    - unless: "echo 'show databases'| sudo mariadb -u root | grep ^students$"
