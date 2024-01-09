# Learning-Ansible
Learning Ansible through Real-World Projects


## Ansible Apache Configuration

This Ansible project is designed to configure Apache servers on Ubuntu, Windows, and CentOS machines. It utilizes Ansible roles to ensure a consistent and efficient setup.

## Prerequisites

- [ Ansible Installed on your Local Machine ](https://www.ansible.com/)


## Project Structure

```
ansible_project/
│
├── apache_ubuntu/
│   ├── tasks/
│   │   └── main.yml
│   ├── templates/
│   │   └── index.html.j2
│   ├── handlers/
│   │   └── main.yml
│   └── ...
│
├── apache_windows/
│   ├── tasks/
│   │   └── main.yml
│   ├── templates/
│   │   └── index.html.j2
│   ├── handlers/
│   │   └── main.yml
│   └── ...
│
├── apache_centos/
│   ├── tasks/
│   │   └── main.yml
│   ├── templates/
│   │   └── index.html.j2
│   ├── handlers/
│   │   └── main.yml
│   └── ...
│
├── inventory.ini
├── playbook.yml
└── ...

```

## Usage

1. Update the `inventory.ini` file with the IP addresses of your servers and the remote user.
2. Run the playbook using the following command:

    ```bash
    ansible-playbook -i inventory.ini playbook.yml
    ```

3. Watch as Ansible configures Apache on your servers!

## Customization

- Modify the `templates/index.html.j2` file to change the default HTML content.
- Adjust variables and tasks in the role-specific files for further customization.

## Tags

Use the following tags for selective execution:

- `apache_ubuntu`: Configure Apache on Ubuntu machines.
- `apache_windows`: Configure Apache on Windows machines.
- `apache_centos`: Configure Apache on CentOS machines.

## Acknowledgements

We would like to express our gratitude to the following:

- [Ansible](https://www.ansible.com/) - For providing a powerful automation tool.
- A special thanks to [Learn Linux TV](https://www.youtube.com/@LearnLinuxTV) for their valuable knowledge sharing on Ansible, which has been instrumental in shaping this project.


