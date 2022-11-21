#!/bin/sh

# env
if [ -s ~/.env ]; then
	source ~/.env
else
	echo '~/.env was nothing'
fi
