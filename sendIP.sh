#!/bin/bash

set -e # exit on error

# http://www.linuxjournal.com/content/return-values-bash-functions

function testConnection()
{
#    echo "Connection test for network device $1"
    local it="indirizzo inet:"
    local en="inet addr:"
    local pattern_match=$en
    if ifconfig ${1} 2<&1 | grep -q "$pattern_match" ; then
        echo "true"
    else
        echo "false"
    fi  
}

function connectionIsReady()
{
    GUARD=true

	if $(testConnection wlan0) || $(testConnection eth0); then
		GUARD=false
	fi

	COUNTER=0
	MAX_ATTEMPTS=4
	SLEEP_TIME=10

	while $GUARD; do
        echo "The counter is ${COUNTER}, sleep ${SLEEP_TIME}s before next attempt ..."
        sleep $SLEEP_TIME;	

        if [ $GUARD ]; then
		    echo "Rete non disponibile ..."
		else
		    echo "Network Ready ;)"
		fi  

		if $(testConnection wlan0) || $(testConnection eth0) || [ $COUNTER -eq $MAX_ATTEMPTS ] ; then
            GUARD=false
            echo "Connection ready or max attemps"
		else
            let COUNTER=COUNTER+1
		fi
	done
}

function sendMailFromRecipientFile() {
        recipient_file=${1}

        if [ ! -f $recipient_file ];
        then
                echo "Selected Recipient file: $recipient_file not found, mails not sent ... exit"
                exit
        fi

        connectionIsReady

	_IP=$(hostname -I) || false

        if [ "$_IP" ]; then
            echo "$_IP"

            while read email
            do
                    target=$email
                    echo "Send mail to: $target"
                    subject="New IP"
                    printf "My IP address is %s\n" "$_IP" | mail -s "${subject}" ${target}
            done < $recipient_file

        else
            echo "No ip found ... exit"
        fi 
        
}

if [ -n "$1" ];
then
	echo "Send Mail from recipient"
	sendMailFromRecipientFile $1
else
    echo "[ usage ] recipient file needed: bash $0 recipient"
fi
