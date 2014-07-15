send-hostname-on-reboot-via-mail
================================

Invia una mail ad ogni riavvio del sistema contenente l'IP della macchina

Configurazione di sendmail
==========================

Per configurare il comando sendmail, di modo che invii email a nome del vostro account gmail, seguite questa guida

    http://linuxconfig.org/configuring-gmail-as-sendmail-email-relay
  
Usage
=====

Per conoscere il proprio IP eseguire lo script:

    sh printHostName.sh

Per automatizzare la rilevazione e la segnalazione, è possibile eseguire il segguente script, il quale inizializza un nuovo crontab:

    bash init_crontab.sh

Nota: eseguire il comando precedente nella cartella del progetto, per rispettare i riferimenti tra script
