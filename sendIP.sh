#!/bin/bash

set -e # exit on error

function sendMailFromRecipientFile() {
        recipient_file=${1}

        if [ ! -f $recipient_file ];
        then
                echo "Selected Recipient file: $recipient_file not found, mail not sent"
                exit
        fi

        while read email
        do
                target=$email

                echo "Send mail to: $target"

                subject="New HostName"
                sh printIP.sh | mail -s "${subject}" ${target}
        done < $recipient_file
}

if [ -n "$1" ];
then
	echo "Send Mail from recipients"
	sendMailFromRecipientFile $1
fi
