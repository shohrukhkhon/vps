#run.sh USER_PASSWORD NGROK_AUTH_TOKEN CHROME_HEADLESS_CODE MACHINE_NAME USERNAME GOOGLE_REMOTE_PIN
#!/bin/bash

sudo useradd -m $USERNAME
sudo adduser $USERNAME sudo
echo "$USERNAME:$USER_PASSWORD" | sudo chpasswd
sed -i 's/\/bin\/sh/\/bin\/bash/g' /etc/passwd
sudo apt-get update
wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb
sudo dpkg --install chrome-remote-desktop_current_amd64.deb
sudo apt install --assume-yes --fix-broken
sudo DEBIAN_FRONTEND=noninteractive \
apt install --assume-yes xfce4 desktop-base
sudo bash -c 'echo "exec /etc/X11/Xsession /usr/bin/xfce4-session" > /etc/chrome-remote-desktop-session'
sudo apt install --assume-yes xscreensaver
sudo systemctl disable lightdm.service
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg --install google-chrome-stable_current_amd64.deb
sudo apt install --assume-yes --fix-broken
sudo apt install nautilus nano -y
sudo apt install gdebi
sudo apt -y install firefox
sudo hostname $MACHINE_NAME
sudo adduser $USERNAME chrome-remote-desktop
sudo apt install tightvncserver
echo -e "no\n$USER_PASSWORD\n$USER_PASSWORD" | tightvncserver :1
echo -e "$GOOGLE_REMOTE_PIN\n$GOOGLE_REMOTE_PIN" | su - $USERNAME -c """$CHROME_HEADLESS_CODE"""

if [[ -z "$NGROK_AUTH_TOKEN" ]]; then
  echo "Please set 'NGROK_AUTH_TOKEN'"
  exit 2
fi

if [[ -z "$USER_PASSWORD" ]]; then
  echo "Please set 'USER_PASSWORD' for user: $USER"
  exit 3
fi

echo "### Install ngrok ###"

wget -q https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-386.tgz
tar xvzf ngrok-v3-stable-linux-386.tgz
chmod +x ./ngrok

echo "### Update user: $USER password ###"
echo -e "$USER_PASSWORD\n$USER_PASSWORD" | sudo passwd "$USER"

echo "### Start ngrok proxy for 22 port ###"


rm -f .ngrok.log
./ngrok authtoken "$NGROK_AUTH_TOKEN"
./ngrok tcp 22 --log ".ngrok.log" &

sleep 10
HAS_ERRORS=$(grep "command failed" < .ngrok.log)

if [[ -z "$HAS_ERRORS" ]]; then
  echo ""
  echo "=========================================="
  echo "To connect: $(grep -o -E "tcp://(.+)" < .ngrok.log | sed "s/tcp:\/\//ssh $USER@/" | sed "s/:/ -p /")"
  echo "Connect with remote desktop: https://remotedesktop.google.com/access"
  echo "=========================================="
else
  echo "$HAS_ERRORS"
  exit 4
fi
