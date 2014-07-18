#!/bin/bash

set -e # exit on error

# http://www.linuxjournal.com/content/return-values-bash-functions

function testConnection()
{
#    echo "Test connection for network device $1"
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
	
	sleep $SLEEP_TIME;

    	while $GUARD; do
        	if [ $GUARD ]; then
		    echo "Rete non disponibile ..."
		else
		    echo "Rete dispobile ;)"
		fi  

		if $(testConnection wlan0) || $(testConnection eth0) || $COUNTER -lt $MAX_ATTEMPTS ; then
		   GUARD=false
		else
			echo "The counter is ${COUNTER}, sleep ${SLEEP_TIME}s before next attempts ..."
        		let COUNTER=COUNTER+1
        		sleep $SLEEP_TIME;	
		fi
	done
}

function sendMailFromRecipientFile() {
        recipient_file=${1}

        if [ ! -f $recipient_file ];
        then
                echo "Selected Recipient file: $recipient_file not found, mail not sent"
                exit
        fi

        connectionIsReady
        echo "Rete dispobile ;)"
        
        while read email
        do
                target=$email

                echo "Send mail to: $target"
                subject="New IP"
                sh printIP.sh 2<&1 | mail -s "${subject}" ${target}
        done < $recipient_file
}

if [ -n "$1" ];
then
	echo "Send Mail from recipients"
	sendMailFromRecipientFile $1
else
    echo "[ usage ] recipient file needed: bash $0 recipient"
fi
