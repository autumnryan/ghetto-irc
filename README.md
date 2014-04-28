ghetto-irc
==========

The most ghetto irc client possible

Usage: ./ghetto_irc.sh username #channel server

Where 'server' is the directory containing the file '#channel'

In a second terminal (or tmux/screen split window):

tail -f server/#channel

While active, the following commands are valid:

/join #newchannel  - Joins the specified channel
/server newserver  - Switches to the specified server
/name newname      - Changes your name
/mode newmode      - Changes your avatar

Where newmode is one of:
brontosaurus
cow
dog
dong
random
turtle