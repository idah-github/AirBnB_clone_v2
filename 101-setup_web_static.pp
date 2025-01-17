# Prepare servers for static files deployment

exec { 'apt-get-update':
  command => '/usr/bin/apt-get -y update',
}
-> exec {'ngnx':
  command => '/usr/bin/env apt-get -y install nginx',
}
-> exec {'makedirectory':
  command => '/usr/bin/env mkdir -p /data/web_static/releases/test/',
}
-> exec {'directory':
  command => '/usr/bin/env mkdir -p /data/web_static/shared/',
}
-> exec {'html':
  command => '/usr/bin/env echo "<html>
  <head>
  </head>
  <body>
        Holberton School
  </body>
</html>" > /data/web_static/releases/test/index.html',
}
-> exec {'link':
  command => '/usr/bin/env ln -sf /data/web_static/releases/test /data/web_static/current',
}
-> exec {'alias':
  command => '/usr/bin/env sed -i "/listen 80 default_server/a location /hbnb_static/ { alias /data/web_static/current/;}" /etc/nginx/sites-available/default',
}
-> exec {'ownership':
  command => '/usr/bin/env chown -R ubuntu:ubuntu /data',
}
-> exec {'restart':
  command => '/usr/bin/env service nginx restart',
}
