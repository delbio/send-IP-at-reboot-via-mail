command="sh $(pwd)/sendHostName.sh ${1}"
job="@reboot ${command}"
cat <(fgrep -i -v "$command" <(crontab -l)) <(echo "$job") | crontab -
crontab -l
