#!/bin/bash
UNAME=$1
CHANNEL=$2
SERVER=$3
clear
if [ -z "$UNAME" ]
then
    echo "NO USERNAME, noob"
    UNAME="noob"
fi
if [ -z "$CHANNEL" ]
then 
    echo "NO CHANNEL, JOINING #ghetto_irc"
    CHANNEL="#ghetto_irc"
fi
if [ -z "$SERVER" ]
then 
    echo "NO SERVER, JOINING ."
    SERVER="."
fi
while :
do
#create/chmod 777 new channel
    if [ ! -e $SERVER/$CHANNEL ]
    then
	touch $SERVER/$CHANNEL
	chmod 777 $SERVER/$CHANNEL
    fi

    echo -n "[$CHANNEL]<$UNAME>: "
    read MSG

    DELICIOUS_MSG=( $MSG )

    if [ `echo ${DELICIOUS_MSG[0]} | sed "s/\(.\)\(.*\)/\1/"` = "/" ]
    then
	case ${DELICIOUS_MSG[0]} in
	    "/name")
		UNAME=${DELICIOUS_MSG[1]}
		;;
	    "/join")
		CHANNEL=${DELICIOUS_MSG[1]}
		;;
	    "/server")
		SERVER=${DELICIOUS_MSG[1]}
		;;
	    "/quit")
		exit 1
		;;
	esac
    else
	echo "["`date +%H:%M`"]<$UNAME> $MSG" >> $SERVER/$CHANNEL
    fi
done
