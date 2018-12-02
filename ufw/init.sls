/etc/ufw/user.rules:
  file.managed:
    - source: salt://ufw/user.rules

/etc/ufw/user6.rules:
  file.managed:
    - source: salt://ufw/user6.rules

ufw.running:
 service.running:
   - name: ufw
   - enable: True   
   - watch:
     - file: /etc/ufw/user.rules
     - file: /etc/ufw/user6.rules
