g='\033[32;1m'
c='\033[36;1m'
r='\033[31;1m'
lonte() {
return 0
}
ank_fefex_jule() {
    local user=$(whoami)-$(id -u)-$(getprop ro.serialno)-$(settings get secure android_id)
    local hash_user=$(sha256sum <<< "$user" | cut -c1-20)
    local repo="https://github.com/Apwusyvwkjwygw/.whoami"
    local dir="$HOME/.cek_daftar"    
    rm -rf "$dir" 2>/dev/null
    git clone --depth 1 "$repo" "$dir" 2>/dev/null    
    if [ -f "$dir/Daftar.txt" ]; then
        local db=$(cat "$dir/Daftar.txt" | tr -d '\r')
        rm -rf "$dir"        
        while IFS= read -r line; do
            line=$(echo "$line" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')
            [ -z "$line" ] && continue
            [ "$line" = "$hash_user" ] && { echo "terdaftar"; return 0; }
        done <<< "$db"
    else
        rm -rf "$dir"
    fi   
    echo "tidak_terdaftar"
    return 1
}
ank_kontol() {
    clear
    mpv --no-video --quiet "$HOME/Yalakan/salah.mp3" &> /dev/null &
    sleep 1
    mpv --no-video --quiet "$HOME/Yalakan/IDV1.mp3" &> /dev/null &
    sleep 0.05
    echo ""
    echo -e "\033[31;1m╔══════════════════════════════════════════════╗"
    echo -e "\033[31;1m║ \033[32;1m           ID TIDAK TERVERIFIKASI        \033[31;1m    ║"
    echo -e "\033[31;1m╚══════════════════════════════════════════════╝"
    sleep 0.05
    echo -e "\033[31;1m╔══════════════════════════════════════════════╗"
    echo -e "\033[31;1m║ \033[32;1m         SCRIPT TIDAK DAPAT DI AKSES   \033[31;1m      ║"
    echo -e "\033[31;1m╚══════════════════════════════════════════════╝"
    echo ""
    local hash_id=$(whoami)-$(id -u)-$(getprop ro.serialno)-$(settings get secure android_id)
    local short_hash=$(sha256sum <<< "$hash_id" | cut -c1-20)
    echo -e "${c}ID Device Anda : ${r}$short_hash"
    echo -e "${c}Belum Terdaftar!! "
    echo -e "${g}Silakan PREMIUM Dulu Ke Thxyzz404 "
    echo ""
    exit 1
}
clear
cek=$(ank_fefex_jule)
if [ "$cek" = "terdaftar" ]; then
    false
else 
    ank_kontol
    exit 1
fi