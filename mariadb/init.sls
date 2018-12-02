mariadb-server:
 pkg.installed

mariadb-client:
 pkg.installed

#echo "CREATE DATABASE students;" | sudo mariadb -u root:
# cmd.run

/tmp/createuser.sql:
  file.managed:
    - source: salt://mariadb/createuser.sql

/tmp/insert.sql:
  file.managed:
    - source: salt://mariadb/createuser.sql

/tmp/.my.cnf:
  file.managed:
    - mode: 644
    - source: salt://mariadb/.my.cnf

/usr/local/bin/mariadbuser.sh:
  file.managed:
    - mode: 755
    - source: salt://mariadb/config.sh

'cat /tmp/createuser.sql|mariadb -u root':
  cmd.run:
    - unless: "echo 'show databases'| sudo mariadb -u root | grep ^students$"

#my.cfg:
#  cmd.run:
#    - name: /tmp/config.sh

#'cat /tmp/insert.sql|mariadb -u teacher':
#  cmd.run:
#    - unless: "echo 'SELECT * FROM students;'| sudo mariadb -u root | grep ^Make$"
