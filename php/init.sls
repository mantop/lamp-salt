libapache2-mod-php:
 pkg.installed

php-mysql:
 pkg.installed

/etc/apache2/mods-available/php7.2.conf:
 file.managed:
   - source: salt://php/php7.2.conf

php.editcheck:
 service.running:
   - name: apache2
   - watch:
     - file: /etc/apache2/mods-available/php7.2.conf
