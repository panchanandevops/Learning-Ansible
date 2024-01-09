#!/bin/bash

# Create directory structure
mkdir -p ansible_project/apache_ubuntu/{tasks,templates,handlers}
mkdir -p ansible_project/apache_windows/{tasks,templates,handlers}
mkdir -p ansible_project/apache_centos/{tasks,templates,handlers}

# Create files with content
cat << 'EOF' > ansible_project/inventory.ini
[web_servers]
ubuntu_machine ansible_host=your_ubuntu_ip
windows_machine ansible_host=your_windows_ip
centos_machine ansible_host=your_centos_ip

[web_servers:vars]
ansible_user=your_remote_user
EOF

cat << 'EOF' > ansible_project/apache_ubuntu/tasks/main.yml
---
- name: Install Apache on Ubuntu
  ansible.builtin.package:
    name: apache2
    state: present
  ansible.builtin.copy:
    src: templates/index.html.j2
    dest: /var/www/html/index.html
  notify: Restart Apache
EOF

cat << 'EOF' > ansible_project/apache_windows/tasks/main.yml
---
- name: Install Apache on Windows
  ansible.builtin.win_chocolatey:
    name: apache-httpd
  ansible.builtin.copy:
    src: templates/index.html.j2
    dest: C:\Apache24\htdocs\index.html
EOF

cat << 'EOF' > ansible_project/apache_centos/tasks/main.yml
---
- name: Install Apache on CentOS
  ansible.builtin.package:
    name: httpd
    state: present
  ansible.builtin.copy:
    src: templates/index.html.j2
    dest: /var/www/html/index.html
  notify: Restart Apache
EOF

cat << 'EOF' > ansible_project/apache_ubuntu/templates/index.html.j2
<!DOCTYPE html>
<html>
<head>
    <title>Apache Server</title>
</head>
<body>
    <h1>Welcome to the {{ ansible_distribution }} Server on Ubuntu!</h1>
    <p>This server is running Apache.</p>
</body>
</html>
EOF

cat << 'EOF' > ansible_project/apache_windows/templates/index.html.j2
<!DOCTYPE html>
<html>
<head>
    <title>Apache Server</title>
</head>
<body>
    <h1>Welcome to the {{ ansible_distribution }} Server on Windows!</h1>
    <p>This server is running Apache.</p>
</body>
</html>
EOF

cat << 'EOF' > ansible_project/apache_centos/templates/index.html.j2
<!DOCTYPE html>
<html>
<head>
    <title>Apache Server</title>
</head>
<body>
    <h1>Welcome to the {{ ansible_distribution }} Server on CentOS!</h1>
    <p>This server is running Apache.</p>
</body>
</html>
EOF

cat << 'EOF' > ansible_project/apache_ubuntu/handlers/main.yml
---
- name: Restart Apache on Ubuntu
  ansible.builtin.service:
    name: apache2
    state: restarted
EOF

cat << 'EOF' > ansible_project/apache_windows/handlers/main.yml
---
- name: Restart Apache on Windows
  ansible.builtin.win_service:
    name: Apache2.4
    state: restarted
EOF

cat << 'EOF' > ansible_project/apache_centos/handlers/main.yml
---
- name: Restart Apache on CentOS
  ansible.builtin.service:
    name: httpd
    state: restarted
EOF

cat << 'EOF' > ansible_project/playbook.yml
---
- name: Configure Apache on Ubuntu
  hosts: ubuntu_machine
  become: true
  roles:
    - role: apache_ubuntu
      tags:
        - apache_ubuntu

- name: Configure Apache on Windows
  hosts: windows_machine
  become: true
  roles:
    - role: apache_windows
      tags:
        - apache_windows

- name: Configure Apache on CentOS
  hosts: centos_machine
  become: true
  roles:
    - role: apache_centos
      tags:
        - apache_centos
EOF

echo "Directory structure and files created successfully!"
