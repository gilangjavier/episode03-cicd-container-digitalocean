#! /bin/bash
sudo apt-get update
sudo apt install openjdk-8-jre-headless -y
cd /opt
sudo wget https://download.sonatype.com/nexus/3/latest-unix.tar.gz -O nexus.tar.gz
sudo tar xzvf nexus.tar.gz
sudo mv nexus-3.41.1-01 nexus
sudo rm -rf /opt/nexus.tar.gz
sudo useradd nexus
sudo chown -R nexus:nexus /opt/nexus
sudo chown -R nexus:nexus /opt/sonatype-work
sudo cat <<EOT>> /etc/systemd/system/nexus.service
[Unit]
Description=nexus service
After=network.target
[Service]
Type=forking
LimitNOFILE=65536
ExecStart=/opt/nexus/bin/nexus start
ExecStop=/opt/nexus/bin/nexus stop
User=nexus
Restart=on-abort
[Install]
WantedBy=multi-user.target
EOT
sudo systemctl start nexus
sudo systemctl enable nexus