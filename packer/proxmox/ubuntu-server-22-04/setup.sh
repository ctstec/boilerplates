#! /usr/bin/env bash

apt update && apt -y upgrade && apt -y autoremove --purge

echo "Reboot in cloud.cfg eintragen"
cat <<'EOT' >> /etc/cloud/cloud.cfg

package_update: true

power_state:
  delay: "now"
  mode: reboot
  message: Neustart...
  timeout: 30
  condition: True
EOT

# Manage Ansible access
# groupadd -g 1001 ansible
# useradd -m -g 1001 -u 1001 ansible
# mkdir /home/ansible/.ssh
# echo -e "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDCdcq31O/royK36M+YxvS4dVN48e79a0BALJtjsdghKpi5zHBWVqJQODgamfsVXFuyp/YBsjhg89Hudb85qoc9IZN5Yd6tAR42w9cS9W8qqviwtgR4ia42a5c1+DbAjb0lWWjHhtJhuFU+MbMGcQ/UMzqmm99qhJAwwvkfihP4flOimTcsOcH/LU+dePY9psMvevdPj0miBCqueeOSP++Sslu6lVPisMXq90Pvsn19116/DKWgrsi1rPorIwVHnBXWD+gr97lVbHjFJX0/nmZNLGMM+9NPE0ZTvXKw6/KX9tEMvLYgimKHT9bk9N4bq7ztd54t1FgyZ/p454RNWw5j0oN1mULchTbS7athzK2lo/wUyTUPJz8z7AWqw2BORfjTLGDJiQM4lAZSv8hcQd+Rn4ExOTTlF07wRv43DZuRRUX4sLFNqm7lZJ2LpZhJP9jWQDFwxwm2RTHWzUXorupT+lxFlzNeFCLgPr3iwLxXE6cNrYxu2Tnw0PVQ7nJkH/s= ansible@everywhere" >> /home/ansible/.ssh/authorized_keys
# chown -R ansible:ansible /home/ansible/.ssh
# chmod 700 /home/ansible/.ssh
# chmod 600 /home/ansible/.ssh/authorized_keys
# echo "ansible ALL=(ALL:ALL) NOPASSWD:ALL" > /etc/sudoers.d/ansible
# chmod 440 /etc/sudoers.d/ansible


rm -f /var/run/utmp
rm -rf /tmp/* /var/tmp/*
unset HISTFILE; rm -rf /home/*/.*history /root/.*history

# cleanup current SSH keys so templated VMs get fresh key
rm -f /etc/ssh/ssh_host_*


echo "truncate any logs that have built up during the install"
find /var/log -type f -exec truncate --size=0 {} \;

echo "Force a new random seed to be generated"
rm -f /var/lib/systemd/random-seed

echo "Clear the history so our install commands aren't there"
rm -f /root/.wget-hsts
export HISTSIZE=0
