(use-modules
 (mtfa error-handler)
 (mtfa utils)
 (mtfa serializer)
 (mtfa unordered-set) ;;unordered set con chiavi (stringhe, numeri o sumimboli: tutto convertito in stringa). Persistente
 (mtfa unordered-map) ;;unordered map con chiavi (stringhe) e valori (qualsiasi cosa). persistente
 (mtfa star-map)      ;;Inserisce stringhe con o senza jolly, la stringa che definisce il jolly e il valore. Cerca le stringhe che matchano!
 (mtfa simple_db)
 (mtfa certs)
 (mtfa eis)
 ;;(mtfa fsm)
 (mtfa va)
 (mtfa extset)  ;;gestisce insiemi i cui elementi sono stringhe! consente operazioni di clone, set, check, get all.... Definisce una macro che consente di creare "al volo" una sottoclasse le cui istanze condividono gli stessi elementi.
 (mtfa umset)   ;;è una unordered map (non persistente) che ha stringhe come chiavi e ha insiemi di stringhe come valori. Ogni insert aggiunge all'insieme corrispondente. Definisce inoltre la mtfa-umap-list che consente di mappare liste come chiavi e qualsiasi valore come valore
 (mtfa web)
 (mtfa brg)
 (mtfa lazy-seq)
 (mtfa domain-fiber-server)
 ;;
 (pfds sets)
 (simple-zmq)
 ;;
;; (gnutls)
 ;;
 ;;i moduli di guile
 ;;((rnrs records syntactic) #:prefix rnrs::)
 (rnrs bytevectors)
 (rnrs arithmetic bitwise)
 ((rnrs io ports)
  #:select (string->bytevector bytevector->string)
  #:prefix ioports:)
 ;;
 (srfi srfi-1)
 (srfi srfi-9)
 (srfi srfi-11)
 ((srfi srfi-18)
  #:prefix srfi-18::) ;;thread e mutex
 ;; date & time rinomina per avere un current time che non si sovrappone
 (srfi srfi-19)
 (srfi srfi-26)
 ;;(srfi srfi-28)
 (srfi srfi-43)
 (srfi srfi-60)
 (web uri)
 (system foreign)
;;
 (ice-9 format)
 (ice-9 ftw)
 (ice-9 rdelim)
 (ice-9 pretty-print)
 (ice-9 regex)
 (ice-9 iconv)
 (ice-9 string-fun)
 (ice-9 peg)
 (ice-9 peg string-peg)
 (ice-9 vlist)
 (ice-9 q)
 (ice-9 binary-ports)
 (ice-9 threads)
 (ice-9 hash-table)
 (ice-9 control)
 (ice-9 match)
 (ice-9 receive)
 (ice-9 eval-string)
 (ice-9 arrays)
 ;;
 (oop goops)
 (oop goops describe)
 ;; (sxml simple)
 ;; (sxml ssax)
 ;; (sxml xpath)
 (json)
 (system syntax)
 (system foreign)
 ;;
 (fibers web server)
 ;;
 (web client)
 ;;
 (ffi blis)
 )

;;
;;Init del generatore di numeri casuali
(mtfa-rand-seed (string->number (TimeStamp)))
;;
;;Initialization terminated. Program started
;;
;;(define (KamRun dummy1 dummy2 fun pbuf)
;;  ((eval-string fun) pbuf))

;;HTTP microservices example
(defun Manage::API (actionl pbuf)
  (eis::GiveErrorHTTP401) =>
  (Show "In API...")
  (eis::GiveHTTPJSONAnswer '(("answer" . "ok")))
  )

(define (LispFun1 host cookie)
  (Show host ", " cookie)
  #t)

#|
(define (NomeFunzione parametri)
  (try-catch
    comando da eseguire in caso di errore
    corpo della funzione
  )
)
 
(defun NomeFunzione (parametri)
       comando da eseguire in caso di errore =>
       corpo della funzione
       )

(defun NomeFunzione (parametri)
       corpo della funzione
       )
|#

(defun Manage::API1 (actionl pbuf)
  (eis::GiveErrorHTTP401) =>

  #|Tutti gli elementi che possono essere utilizzati dalla sessione
            (mtfa-eis-get-value-current-query pbuf "variabile")
            (mtfa-eis-get-value-current-headers pbuf "Content-Type")
            mtfa-eis-get-current-headers
            mtfa-eis-get-value-current-cookies
            mtfa-eis-get-current-body
            mtfa-eis-get-current-method
            mtfa-eis-get-current-protocol
            mtfa-eis-get-current-host
            mtfa-eis-get-current-port
            mtfa-eis-get-current-pars
            mtfa-eis-get-current-tag
            mtfa-eis-get-current-url
            mtfa-eis-get-current-uri
            mtfa-eis-get-current-user-passwd
            mtfa-eis-get-current-ip-src
            mtfa-eis-get-current-ip-dst
            mtfa-eis-get-current-port-src
            mtfa-eis-get-current-port-dst

	    Per inviare risposte al client o all'ambiente della ARS
            eis::BaseLib::PassToServer => si collega con un altro server a attiva una comunicazione come se fosse un proxy (tcp.redirect)
            eis::BaseLib::NeedMoreData => i dati associati alla richiesta sono insufficienti (content-lengt di 100 e dati arrivati 50)
            eis::BaseLib::ContinueAfterAccept
            eis::BaseLib::BlockSession
            eis::GiveAnswerAndCloseAll risposta e chiudo la connessione
            eis::GiveAnswerAndNotClose
            eis::Redirect http location...203
            eis::GiveFileAndClose
            eis::GiveFileAndNotClose
            eis::http-content-type-html
            eis::http-content-type-text
            eis::http-content-type-b64
            eis::http-content-type-xml
            eis::http-content-type-javascript
            eis::http-answer-ok
            eis::http-content-length sinonimo di 200 ok
            eis::http-connection-close
            eis::http-connection-keep-alive
            eis::http-eoln
            eis::http-end-of-headers
            eis::BaseLib::BuildHTTPAnswer
            eis::GiveHTTPAnswer
            eis::GiveHTTPHtmlAnswer
            eis::GiveHTTPXmlAnswer
            eis::GiveHTTPTextAnswer
            eis::GiveHTTPB64Answer
            eis::GiveHTTPJSONAnswer
            eis::GiveErrorHTTP404
            eis::GiveErrorHTTP401
            eis::GiveErrorHTTP500
            eis::LoadPage
            eis::SplitPostData  var=valore&var=valore => hash k,v
|#

  (Show "In API...")
  
  ;;se dovete controllare squando un particolare valore transitato è superiore a X, allora
  ;;potete fare una MANAGE e dentro l'hook prendere il valore e verificarlo e poi far transitare verso 
  ;;il server di destinazione
;;se sono "" o #nil passa quello ricevuto dal client
;;(eis::BaseLib::PassToServer ip_dest porta_dest host method headers url body)
  
  (eis::GiveHTTPAnswer "200 OK" "MyHeader: none" "Set-Cookie: ciccia=ariciccia" "answer=ok&code=199")
  )

#|
Immaginiamo di avere un sito "svr1" che gestisce le pagine /p1, /p2 e /p3
Immaginiamo di avere un sito "svr2" che gestisce le pagine /p1, /p2 e /p3
ma lo voglio mostrare verso l'esterno come /alfa/p1, /alfa/p2, /alfa/p2 per svr1
e /beta/... per il server svr2
=> in apache farei
ProxyPass "/alfa/"  "http://svr1/"
ProxyPassReverse "/alfa"  "http://svr1/" Questo modifica il campo "location" dell'http
ma se il server svr1 nell'html inserisce un href "/p1" allora non è più sufficiente il mod_proxy di apache
poiché non gestisce la parte html. servirebbe il modulo mod_html_proxy che modifica le pagine
inoltre se invece svr1 torna indietro un codice javascript che genera un "location=/p1", allora non potete fare nulla.
|#

;;Add HOOK
(eis::function-pointer-add "API" Manage::API)
(eis::function-pointer-add "API1" Manage::API1)
;;

;;
;;
;;JSON microservices manager (CmdManager) example
(define (JSON-ANSWER::error msg errid)
  `((success . #f)(message . ,msg) (errorid . ,errid)))
;;
(define (JSON-ANSWER::success msg data_name data)
  `((success . #t)(message . ,msg) (data . ((,data_name . ,data)))))

(defun JSONAPI::add (k v pbuf set-names)
  (eis::GiveHTTPJSONAnswer (JSON-ANSWER::error "General System Error" -1))  =>
  (Show "Got add" v)
  (let ((v1 (assoc-ref v "v1")) ;; => Equivalente a javascript v.v1 o v["v1"]
	(v2 (assoc-ref v "v2")))
    (eis::GiveHTTPJSONAnswer (JSON-ANSWER::success "OK" "DATANAME" (+ v1 v2)))
    ))

#|
Conversione JSON-SCHEME
{"k": "v"} => (k . v)
[1, 2, 3] => #(1 2 3)
ES:
{"add": {"v1": 10, "v2": 20}} => (("add" . (("v1" . 10) ("v2" . 20))))
Al contrario
`((success . #t)(message . ,msg) (data . ((,data_name . ,data))))
{"success": true, "message": "contenuto della variabile msg", "data": {"cont di data_name": "cont di data"}}
|#

(define CmdManager (mtfa-web-make-json-requests-manager "JSONAPI"))
;;Si aspetta che le richieste json abbiano sempre la seguente struttura
;;"req1": {k: v, k: v, ...}
;;
;;ESEMPIO CURL: curl http://127.0.0.1:8888/ReqJson --data '{"add": {"v1": 10, "v2": 20}}' -H 'Content-Type:application/json'
;;ESEMPIO CURL: curl http://127.0.0.1:8888/ReqJson --data '{"sub": {"v1": 10, "v2": 20}}' -H 'Content-Type:application/json'
;;ESEMPIO CURL: curl http://127.0.0.1:8888/ReqJson --data '{"mul": {"v1": 10, "v2": 20}}' -H 'Content-Type:application/json'
;;ESEMPIO CURL: curl http://127.0.0.1:8888/ReqJson --data '{"div": {"v1": 10, "v2": 20}}' -H 'Content-Type:application/json'

;;
(CmdManager 'add-handler "add" JSONAPI::add)
;;(CmdManager 'add-handler "sub" JSONAPI::sub)
;;(CmdManager 'add-handler "mul" JSONAPI::mul)
;;(CmdManager 'add-handler "div" JSONAPI::div)





#|
For the MD5-based algorithm, the salt should consist of the string $1$, 
followed by up to 8 characters, terminated by either another $ or the end of the string.
The result of crypt will be the salt, followed by a $ if the salt didn't end with one, 
followed by 22 characters from the alphabet ./0-9A-Za-z, up to 34 characters total.
Every character in the key is significant.
|#
(define salt "$1$cnfjekbg$")
;;TODO read from file!
(define db (db-interface::set-db-coordinates "10.0.2.15" "va" "va" "arpr" 3306))

;; valida il validation cookie inviato 
;;TODO do not rely on first and second ... 
(defun-public is_valid_cookie (lista pbuf)
  (let
    (
      (codice_fiscale "")
      (categoria_rischio "")
      (validation_cookie (bytevector->string (car lista) "UTF-8"))
    )
    (if (equal? (mtfa-eis-get-current-method pbuf) "GET")
      (begin
        (set! codice_fiscale (string-upcase (mtfa-eis-get-value-current-query pbuf "CF")))
        (set! categoria_rischio (string-upcase (mtfa-eis-get-value-current-query pbuf "categoria")))
      )
      (begin
        (set! codice_fiscale (second (string-split (first (string-split (mtfa-eis-get-current-body pbuf #t) #\&)) #\=) ) )
        (set! categoria_rischio (second (string-split (second (string-split (mtfa-eis-get-current-body pbuf #t) #\&)) #\=) ) )
      )
    )
    (Show "codice_fiscale -> " codice_fiscale)
    (Show "categoria_rischio -> " categoria_rischio)
    (Show "str compare with validation_cookie " (equal? (crypt (string-append codice_fiscale ":" categoria_rischio) salt) (uri-decode validation_cookie)))
    ;;(Show "validation_cookie " (crypt (string-append codice_fiscale ":" categoria_rischio) salt))
    (equal? (crypt (string-append codice_fiscale ":" categoria_rischio) salt) (uri-decode validation_cookie))
  )
)

(define app::server::ip "10.0.2.15")
(define app::server::port "9998")


(define (to-application-server pbuf)
  (string-append app::server::ip ":" app::server::port)
)

(define (from-body-CF pbuf)
  (Show "sono in from-body-CF")
  (string-append "ciao" "")
)


(define (KamRun key old-ret variables pbuf)
  ((eval-string (first (string-split variables #\ ))) pbuf)
)

(define (eta_in_range codice_fiscale)
  ;;TODO read from file!
  (define lower_bound 20)
  (define upper_bound 81)
  (Show "eta_in_range is running")
  (let
    ((anno_nascita (string->number (substring codice_fiscale 6 8))))
    (if (and (>= anno_nascita lower_bound) (<= anno_nascita upper_bound))
      #t
      #f
    )
  )
)

(defun Manage::getcategoria (actionl pbuf)
  (Show "getcategoria is running")
  (define connessione (db-interface::DoConnect db))
  (let*
    ( (codice_fiscale (string-upcase (mtfa-eis-get-value-current-query pbuf "CF")))
      (team (mtfa-eis-get-value-current-query pbuf "TEAM"))
      (query (string-append "SELECT cat_rischio from cittadino, team_cittadino where cittadino.codice_fiscale = team_cittadino.codice_fiscale AND cittadino.codice_fiscale='" codice_fiscale "' AND team ='" team "' ORDER BY cat_rischio ASC LIMIT 1;"))
      (data (db-interface::DoSqlQuery connessione query))
      (categoria_rischio #nil)
    )
    (if (> (length data) 0)
      (set! categoria_rischio (string-upcase (car(car data))))
      (if (eta_in_range codice_fiscale) (set! categoria_rischio "Z"))
    )
    (if (not categoria_rischio)
      (eis::GiveHTTPAnswer 
          "HTTP/1.1 303 See Other"
          (string-append  "Location: " 
                          "http://" (mtfa-eis-get-current-ip-dst pbuf) ":" (number->string (mtfa-eis-get-current-port-dst pbuf)) 
                          "/error-page-no-content?CF=" codice_fiscale "&TEAM=" team
          )
          ""
          ""
        )
      ;; answer Redirect with validation cookie
      (eis::GiveHTTPAnswer 
        "HTTP/1.1 302 Found"
        (string-append  "Location: " 
                        "http://" (mtfa-eis-get-current-ip-dst pbuf) ":" (number->string (mtfa-eis-get-current-port-dst pbuf)) (mtfa-eis-get-current-uri pbuf) "&categoria=" categoria_rischio
        )
        (string-append  "Set-Cookie: validation=" 
                        (uri-encode (crypt (string-append codice_fiscale ":" categoria_rischio) salt))
                        "; Path=/ ; Expires=" (date->string (current-date 3600) "~a, ~d  ~b ~Y ~T")
        )
        ""
      )
    )
  )
)

;;HOOK "getcategoria"
(eis::function-pointer-add "getcategoria" Manage::getcategoria)



(defun Manage::errormanager (actionl pbuf)
  (eis::GiveHTTPAnswer 
      "HTTP/1.1 302 Found"
      (string-append  "Location: " 
                      "http://" (mtfa-eis-get-current-ip-dst pbuf) ":" (number->string (mtfa-eis-get-current-port-dst pbuf)) 
                      "/error-page"
      )
      (string-append  "Set-Cookie: validation=expired; Path=/ ; Expires=" (date->string (current-date 0) "~a, ~d  ~b ~Y ~T") "\r\n"
                      "Set-Cookie: session=expired; Path=/ ; Expires=" (date->string (current-date 0) "~a, ~d  ~b ~Y ~T") "\r\n"
      )
      ""
  )
)

;;HOOK "errormanager"
(eis::function-pointer-add "errormanager" Manage::errormanager)


(defun Manage::getriepilogo (actionl pbuf)
  (Show "getriepilogo is running")
  (let
    ( (codice_fiscale (string-upcase (mtfa-eis-get-value-current-query pbuf "CF")))
      (team (mtfa-eis-get-value-current-query pbuf "TEAM"))
      (numero_richiesta (mtfa-eis-get-value-current-query pbuf "NUMERO_RICHIESTA"))
    )
    (eis::GiveHTTPAnswer 
        "HTTP/1.1 302 Found"
        (string-append  "Location: " 
                        "http://" (mtfa-eis-get-current-ip-dst pbuf) ":" (number->string (mtfa-eis-get-current-port-dst pbuf)) (mtfa-eis-get-current-uri pbuf)
        )
        (string-append  "Set-Cookie: session=" 
                        (uri-encode (crypt (string-append codice_fiscale ":" numero_richiesta) salt))
                        "; Path=/ "
        )
        ""
        #t
    )
  )
)

;;HOOK "getriepilogo"
(eis::function-pointer-add "getriepilogo" Manage::getriepilogo)


;; valida il session cookie inviato 
(defun-public is_valid_session_cookie (lista pbuf)
  (Show "is_valid_session_cookie is running")
  (let
    (
      (codice_fiscale (string-upcase (mtfa-eis-get-value-current-query pbuf "CF")))
      (team (mtfa-eis-get-value-current-query pbuf "TEAM"))
      (numero_richiesta (mtfa-eis-get-value-current-query pbuf "NUMERO_RICHIESTA"))
      (session_cookie (bytevector->string (car lista) "UTF-8"))
    )
    (Show "codice_fiscale -> " codice_fiscale)
    (Show "numero_richiesta -> " numero_richiesta)
    (Show "str compare with session_cookie " (equal? (crypt (string-append codice_fiscale ":" numero_richiesta) salt) (uri-decode session_cookie)))
    (equal? (crypt (string-append codice_fiscale ":" numero_richiesta) salt) (uri-decode session_cookie))
  )
)

