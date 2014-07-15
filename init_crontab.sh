
min_args=1

if (( $# < ${min_args} ))
then
    echo "Errore recipient file is needed"
    exit
fi

recipient_file=${1}

if [ ! -f $recipient_file ];
then
        echo "Selected Recipient file: $recipient_file not found"
        exit
fi

command="cd $(pwd); bash sendIP.sh ${recipient_file}"
job="@reboot ${command}"
cat <(fgrep -i -v "$command" <(crontab -l)) <(echo "$job") | crontab -
crontab -l
