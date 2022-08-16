#!/bin/bash

## Script to setup a service to stop throttling cpu when on battery power

# install dependencies
apt update -y
apt upgrade -y
apt install cpufrequtils -y
apt install msr-tools -y


# Create the actual script
echo -ne "Progess : 0/7 \r"

mkdir -p /opt/MyScripts
echo -ne "Progess : 1/7s \r"

cat > /opt/MyScripts/throttlestop.sh <<EOF
#!/bin/sh

# Prevent unset variable problems
set -u

# Change CPU setting
cpufreq-set -c 0 -g performance
cpufreq-set -c 1 -g performance
cpufreq-set -c 2 -g performance
cpufreq-set -c 3 -g performance
modprobe msr
wrmsr 0x1FC 2359388
EOF

echo -ne "Progess : 2/7 \r"

# make the script executable
chmod 777 /opt/MyScripts/throttlestop.sh 
echo -ne "Progess : 3/7 \r"

# create the service: right now I put it after network.target cause I really don't know where else to put it.
cat > /etc/systemd/system/throttlestop.service <<EOF
[Unit]
Description=Stop CPU throttling on battery power
After=network.target

[Service]
Type = simple
ExecStart=/opt/MyScripts/throttlestop.sh

[Install]
WantedBy=multi-user.target
EOF
echo -ne  "Progess : 4/7 \r"

# reload systemd
systemctl daemon-reload
echo -ne "Progess : 5/7 \r"

systemctl enable throttlestop.service
echo -ne "Progess : 6/7 \r"

# start the service                   
systemctl start throttlestop.service
echo -ne "Progess : 7/7 \r"

echo ""
echo "DONE"
exit 0