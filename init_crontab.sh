
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

#debug_command="cd $(pwd); sudo bash sendIP.sh ${recipient_file} 2<&1 >> $(pwd)/debug-ip.txt"

command="cd $(pwd); sudo bash sendIP.sh ${recipient_file}"
job="@reboot ${command}"
cat <(fgrep -i -v "$command" <(sudo crontab -l)) <(echo "$job") | sudo crontab -
sudo crontab -l
