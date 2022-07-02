clear
figlet -f slscript welcome
echo "$(date +"%A %d %B %Y") @$(uptime | cut -d"," -f 1 -f 2)\n"
