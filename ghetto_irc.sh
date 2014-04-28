#!/bin/bash
UNAME=$1
CHANNEL=$2
SERVER=$3
MODE="cow"
MODELIST=( cow turtle brontosaurus dog dong )
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
	    "/mode")
		MODE=${DELICIOUS_MSG[1]}
		;;
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
	if [ "$MODE" = "random" ]
	then
	    ALAMODE=${MODELIST[$RANDOM%4]}
	else
	    ALAMODE=$MODE
	fi
	case $ALAMODE in
	    "cow")
		echo "
    < $MSG >
         \   ^__^
          \  (oo)\_______
             (__)\ $UNAME )\/\

                 ||----w |
["`date +%H:%M`"]          ||     ||
" >> $SERVER/$CHANNEL
		;;
	    "brontosaurus")
		echo "
                    < $MSG >
                      __ /
                     / _)
            _.----._/ /
           /         /
        __/ (  | (  |
["`date +%H:%M`"]/__.-'|_|--|_| <$UNAME>
" >> $SERVER/$CHANNEL
		;;
	    "turtle")
		echo "
                      < $MSG >
          _____     ____   /
         /      \  |  o | /
        |        |/ ___\|
        |_________/
["`date +%H:%M`"] |_|_| |_|_| <$UNAME>
" >> $SERVER/$CHANNEL
		;;
	    "dog")
		echo "
                  < $MSG >
                  __  /
                 ()'\`;
                 /\|\`
                /  |
["`date +%H:%M`"]       (/_)_|_  <$UNAME>
" >> $SERVER/$CHANNEL
		;;
	    "dong")
		echo "
          < $MSG >
          _  /
         /\)
        / /
       ( Y)
["`date +%H:%M`"] \"\" <$UNAME>
" >> $SERVER/$CHANNEL
		;;
	    *)
		echo "["`date +%H:%M`"]<$UNAME> $MSG" >> $SERVER/$CHANNEL
	esac
    fi
done
