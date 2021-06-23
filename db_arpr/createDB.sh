#!/bin/sh

/opt/lampp/bin/mysql -u root -p -e "CREATE DATABASE prenotazioni_vaccinazioni;
                                    CREATE DATABASE arpr;
                                    CREATE USER portale_prenotazioni@'%' IDENTIFIED BY 'portale_prenotazioni';
                                    GRANT ALL PRIVILEGES ON *.* TO 'portale_prenotazioni'@'%';
                                    GRANT GRANT OPTION ON *.* TO 'portale_prenotazioni'@'%';
                                    CREATE USER va@'%' IDENTIFIED BY 'va';
                                    GRANT ALL PRIVILEGES ON *.* TO 'va'@'%';
                                    GRANT GRANT OPTION ON *.* TO 'va'@'%';
                                    FLUSH PRIVILEGES;"


/opt/lampp/bin/mysql -u root -p "prenotazioni_vaccinazioni" < "prenotazioni_vaccinazioni.sql"; 
/opt/lampp/bin/mysql -u root -p "arpr" < "arpr.sql"; 