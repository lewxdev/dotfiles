clear
figlet -f smisome1 welcome
echo ""
echo "$(date +"%A %d %B %Y") @$(uptime | cut -d"," -f 1 -f 2)"
echo ""