#! /bin/bash

OPTIONS="⏻\tShutdown\n⭮\tReboot"

if [ "$@" ]
then
	case $@ in
		*Shutdown)
			shutdown now
			;;
		*Reboot)
			reboot
			;;
	esac
else
	echo -e $OPTIONS
fi

