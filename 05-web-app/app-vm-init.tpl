#cloud-config

datasource:
  Ec2:
    strict_id: false
ssh_pwauth: no
users:
  - name: ${ADMIN_NAME}
    sudo: ALL=(ALL) NOPASSWD:ALL
    shell: /bin/bash
    ssh_authorized_keys:
      - "${ADMIN_SSH_KEY}"
write_files:
- path: /etc/nginx/nginx.conf
  content: |
    error_log stderr notice;

    worker_processes 2;
    worker_rlimit_nofile 130048;
    worker_shutdown_timeout 10s;

    events {
      multi_accept on;
      use epoll;
      worker_connections 16384;
    }

    http {
      aio threads;
      aio_write on;
      tcp_nopush on;
      tcp_nodelay on;

      keepalive_timeout 65;
      keepalive_requests 100;
      reset_timedout_connection on;
      server_tokens off;
      autoindex off;

      server {
        listen 8080 default;
        server_name app.mydom.net;

        location / {
          ssi on;
          ssi_types text/plain;
          return 200 '${HOSTNAME}\n<!--#echo var="DATE_LOCAL" -->\n';
        }

        location /healthz {
          access_log off;
          return 200 'OK';
        }
      }
    }
- path: /root/postinstall.sh
  content: |
    #!/bin/bash -x

    set -e -o pipefail

    timedatectl set-timezone Europe/Moscow
    apt-get -o Acquire::ForceIPv4=true update
    apt-get -yq install nginx -o Dpkg::Options::="--force-confold"

    systemctl enable nginx --now
    nginx -t && nginx -s reload
  permissions: '0740'
runcmd:
  - sleep 2
  - sudo -i
  - /root/postinstall.sh