# Copy this in /etc/crontab for automatic updates every wednesday

#Ubuntu/Debian
50 19 * * 3 root /usr/bin/apt update -q -y >> /var/log/apt/automaticupdates.log
0 20 * * 3 root /usr/bin/apt upgrade -q -y >> /var/log/apt/automaticupdates.log

#Fedora/RHEL
50 19 * * 3 root /usr/bin/dnf update -q -y >> /var/log/apt/automaticupdates.log
0 20 * * 3 root /usr/bin/dnf upgrade -q -y >> /var/log/apt/automaticupdates.log
