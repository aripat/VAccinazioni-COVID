# VAccinazioni-COVID
Presentiamo qui un sistema a supporto della gestione delle prenotazioni per le vaccinazioni COVID-19 nel Lazio. Il sistema si struttura con un application server nodejs, un database MySQL che mantiene i dati delle prenotazioni effettuate, dei poli vaccinali e relativi appuntamenti disponibili e una VA che ha il compito di orchestrare le richieste degli utenti tra il server e un sistema informativo. Nel nostro caso tale sistema è, per semplicità, un altro database MySQL contenente i dati personali degli aventi diritto al vaccino per appartenenza ad una categoria di rischio e tale catrgoria. 

Il progetto è presentato dal gruppo Biancone Saverio, Patrizi Arianna e Ruzzetti Elena Sofia per l'esame di SDC(2021).

## Istruzioni per avviare il sistema in locale

OS: Ubuntu 20.* Virtual Machine

Docker version: 20.10.5

dozenapps/va image: versione aggiornata al 21/06/2021



### MySQL (tramite cartella default di xampp /opt/lampp/bin/mysql)

Per avviare i servizi xampp eseguire il comando

`sudo /opt/lampp/xampp start`

Posizionarsi sulla cartella `./db_arpr` ed eseguire il comando

`sudo bash createDB.sh`

(inserire le password di root quando richiesto)


### Frontend

Posizionarsi nella cartella `./test_server/app` e scaricare le dipendenze di nodejs

`npm install`

Run del server

`npm start`



### Validation Authority

Posizionarsi nella cartella `./gestore_prenotazioni_va` ed eseguire il comando

`sudo docker run -it --network=host -v "$PWD":/vapps dozenapps/va /bin/bash`

Dalla shell interattiva, per lanciare la VA mandare il comando

`/va sdc.conf`


### Accedere all'applicazione

Raggiungere l'url http://127.0.0.1:8888 oppure http://127.0.0.1:8888/home
