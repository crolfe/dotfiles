input=$(echo "Lock\nLogout\nSuspend\nReboot\nShutdown\nCancel" | rofi -show -dmenu)

if [ $input = 'Shutdown' ]; then
	systemctl poweroff
elif [ $input = 'Reboot' ]; then
	systemctl reboot
elif [ $input = 'Suspend' ]; then
	systemctl suspend
elif [ $input = 'Logout' ]; then
	i3-msg exit
elif [ $input = 'Lock' ]; then
	~/.lock/lock.sh ~/.lock/lock.png
elif [ $input = 'Cancel' ]; then
	exit
fi
