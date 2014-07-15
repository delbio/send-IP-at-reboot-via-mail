Send IP via mail @reboot
================================

Invia una mail ad ogni riavvio del sistema contenente l'IP della macchina

Configurazione di sendmail
==========================

Per configurare il comando sendmail, di modo che invii email a nome del vostro account gmail, seguite questa guida

http://linuxconfig.org/configuring-gmail-as-sendmail-email-relay
  
Usage
=====

Per conoscere il proprio IP eseguire lo script:

    sh printIP.sh

Per creare un crontab che segnali il nuovo IP della macchina dopo il riavvio ad un recipiente di indirizzi email, eseguite:

    bash init_crontab.sh $(pwd)/recipient

Per testare il funzionamento basta eseguire:

    sudo reboot
    
riverete una mail appena la macchina è disponibile.

Nota: eseguire il comando precedente nella cartella del progetto, per rispettare i riferimenti tra script

Maggiori informazioni
=====================
Per Maggiori informazioni su crontab:

http://guide.debianizzati.org/index.php/Utilizzo_del_servizio_di_scheduling_Cron#Stringhe_speciali
http://it.wikipedia.org/wiki/Crontab
