/etc/skel/public_html:
 file.directory:
   - mode: 755
   - makedirs: True

/etc/skel/public_html/index.php:
 file.managed:
   - source: salt://skel/index.php

/tmp/index.php:
 file.managed:
   - source: salt://skel/index.php

/usr/local/bin/userresetscript.sh:
 file.managed:
   - source: salt://skel/userresetscript.sh
   - mode: 755
