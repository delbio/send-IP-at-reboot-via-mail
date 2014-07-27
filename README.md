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

Per notificare il nuovo IP della macchina via mail ad un insieme di indirizzi email, creare un file con la lista di destinatari desiderati:

    touch destinatari.txt
    echo "email@dominio.it" >> destinatari.txt
    echo "email1@dominio.com" >> destinatari.txt

Il seguente script inizializzerà il crontab che, al riavvio, invierà l'IP via mail a tutti i destinatari:

    bash init_crontab.sh $(pwd)/destinatari.txt

Per testare il funzionamento basta eseguire:

    sudo reboot
    
Ogni destinatario riceverà una mail appena la macchina è disponibile.

Nota: eseguire il comando precedente nella cartella del progetto, per rispettare i riferimenti tra script

Maggiori informazioni
=====================
Per Maggiori informazioni su crontab:

http://guide.debianizzati.org/index.php/Utilizzo_del_servizio_di_scheduling_Cron#Stringhe_speciali
http://it.wikipedia.org/wiki/Crontab

Lavori correlati
================

http://rpy-italia.org/forum/index.php/topic,153.0.html
