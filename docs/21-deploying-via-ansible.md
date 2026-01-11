# Deploying via Ansible

For the Enterprise SysAdmin managing 100 workstations.

## The Playbook
Here is a sample Ansible task to deploy PrinceTheme.

```yaml
- name: Deploy PrinceTheme
  hosts: workstations
  become: yes
  tasks:
    - name: Create theme directory
      file:
        path: /boot/grub/themes/PrinceTheme
        state: directory
        mode: '0755'

    - name: Copy theme files
      copy:
        src: ./PrinceTheme/
        dest: /boot/grub/themes/PrinceTheme/

    - name: Configure GRUB
      lineinfile:
        path: /etc/default/grub
        regexp: '^GRUB_THEME='
        line: 'GRUB_THEME="/boot/grub/themes/PrinceTheme/theme.txt"'

    - name: Update GRUB (Debian)
      command: update-grub
      when: ansible_os_family == "Debian"
```

## Strategy
1.  Keep the theme in your Ansible repo.
2.  Push updates during maintenance windows.
3.  Ensure `update-grub` runs successfully.
