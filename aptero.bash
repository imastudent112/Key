#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'

progress_bar() {
    bar_length=30  
    duration=5  
    step=$((duration * 10 / bar_length)) 
    
    echo -ne "${GREEN}Loading: ["
    for ((i = 0; i < bar_length; i++)); do
        echo -ne "#"
        sleep .$step
    done
    echo -e "] 100%${NC}"
    sleep 1
}

# Sambutan
welcome() {
    clear
    sleep 0.2
    echo -e "${YELLOW}Node 2 Installer By Buddy"
    sleep 2.5
    clear
    echo -e "${RED}Warning:${GREEN} MEMERLUKAN TOKEN"
    sleep 2.92
    clear
    echo -e "${YELLOW}Buy Token Di BuddyHost [082387631324] 5K"
    sleep 2.91
    clear
    echo -e "${YELLOW}LANJUT!!!"
    sleep 1
    echo ""
    progress_bar
    clear
}
# untuk mengecek dan menginstal paket yang diperlukan
check_packages() {
    local packages=("docker" "nginx" "git" "certbot" "python3-certbot-nginx")
    for pkg in "${packages[@]}"; do  
        if ! command -v "$pkg" &>/dev/null; then  
            echo -e "${YELLOW}Menginstal $pkg...${NC}"  
            sudo apt install -y "$pkg"
            clear 
        else  
            echo -e "${GREEN}$pkg sudah terinstal...${NC}"  
        fi  
    done
}

# untuk mengecek token pengguna
check_token() {
    GITHUB_USER="imastudent112"
    GITHUB_PAT="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"
    GITHUB_REPO="Key"
    GITHUB_RAW_URL="https://raw.githubusercontent.com/$GITHUB_USER/$GITHUB_REPO/main/Key.txt"
    GITHUB_GIVEAWAY_URL="https://raw.githubusercontent.com/$GITHUB_USER/$GITHUB_REPO/main/Giveaway.txt"

    echo -e "${YELLOW}MASUKAN AKSES TOKEN :${NC}"  
    read -s USER_TOKEN  
    USER_TOKEN=$(echo "$USER_TOKEN" | tr -d '[:space:]' | tr '[:lower:]' '[:upper:]')  

    TOKEN_LIST=$(curl -s -u "$GITHUB_USER:$GITHUB_PAT" "$GITHUB_RAW_URL")  
    if echo "$TOKEN_LIST" | grep -q "^$USER_TOKEN$"; then  
        echo -e "${GREEN}Token valid! Login berhasil.${NC}"  
        sleep 2
        return  
    fi  

    echo -e "${RED}Token salah!${NC}"  
    while true; do
        echo -e "${YELLOW}Lanjut pakai Token Giveaway? (y/n/x untuk ulang)${NC}"  
        read -r choice  

        case "$choice" in
            [yY]) 
                clear
                check_ga_token
                return
                ;;
            [xX]) 
                clear
                echo -e "${GREEN}Otewe Restart... Masukin Ulang Token${NC}"
                check_token
                return
                ;;
            [nN]) 
                echo -e "${RED}Acces Di Tolak.${NC}"  
                sleep 2
                exit 1
                ;;
            *) 
                echo -e "${RED}Pilihan tidak valid! coba lagi.${NC}"
                ;;
        esac
    done
}

# untuk mengecek token giveaway
check_ga_token() {
    echo -e "${YELLOW}MASUKAN TOKEN GIVEAWAY :${NC}"  
    read -s USER_TOKEN_GA  
    USER_TOKEN_GA=$(echo "$USER_TOKEN_GA" | tr -d '[:space:]' | tr '[:lower:]' '[:upper:]')  

    GA_TOKEN_LIST=$(curl -s -u "$GITHUB_USER:$GITHUB_PAT" "$GITHUB_GIVEAWAY_URL")  
    if echo "$GA_TOKEN_LIST" | grep -q "^$USER_TOKEN_GA$"; then  
        echo -e "${GREEN}Token Giveaway valid! Login Sukses.${NC}"  
        sleep 2
        return  
    else  
        echo -e "${RED}Token Giveaway salah!${NC}"  
        sleep 2
        exit 1
    fi  
}

# untuk menginstal Wings
wings() {
    clear
    echo -e "${RED}WARNING:${YELLOW} Ini Masi Beta${NC}"
    sleep 2

    while true; do  
        echo -e "${YELLOW}INSTALL PANEL MOHON ISI DATA${NC}"
        read -p "$(echo -e "${YELLOW}Pw Adp: ${NC}")" ID
        read -p "$(echo -e "${YELLOW}Pw MariaDB: ${NC}")" PMDB
        read -p "$(echo -e "${YELLOW}Web Panel URL (tanpa / di akhir): https://${NC}")" WEB
        read -p "$(echo -e "${YELLOW}Nama User: ${NC}")" ANI
        echo -e "${RED}WARNING:${YELLOW} URL harus format https://example.com tanpa slash di akhir.${NC}"
        sleep 1
        clear
        apt -y install software-properties-common curl apt-transport-https ca-certificates gnupg && LC_ALL=C.UTF-8 add-apt-repository -y ppa:ondrej/php && curl -fsSL https://packages.redis.io/gpg | sudo gpg --dearmor -o /usr/share/keyrings/redis-archive-keyring.gpg && echo "deb [signed-by=/usr/share/keyrings/redis-archive-keyring.gpg] https://packages.redis.io/deb $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/redis.list && apt -y install php8.3 php8.3-{common,cli,gd,mysql,mbstring,bcmath,xml,fpm,curl,zip} mariadb-server nginx tar unzip git redis-server && curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer && mkdir -p /var/www/pterodactyl && cd /var/www/pterodactyl && curl -Lo panel.tar.gz https://github.com/pterodactyl/panel/releases/latest/download/panel.tar.gz && tar -xzvf panel.tar.gz && chmod -R 755 storage/* bootstrap/cache/ && mariadb
CREATE USER 'pterodactyl'@'127.0.0.1' IDENTIFIED BY '$PMDB';
CREATE DATABASE panel;
GRANT ALL PRIVILEGES ON panel.* TO 'pterodactyl'@'127.0.0.1' WITH GRANT OPTION;
exit   
cp .env.example .env
COMPOSER_ALLOW_SUPERUSER=1 composer install --no-dev --optimize-autoloader && php artisan key:generate --force && php artisan p:environment:setup
admin@gmail.com
$WEB
UTC
redis
redis
redis
echo ""
echo "n"

}


# akhir
selesai() {
    echo -e "${GREEN}Selesai! Silahkan Check Di Panel/Web${NC}"
    sleep 2
}

# Jalankan semua fungsi
welcome
check_packages
check_token
panel
selesai