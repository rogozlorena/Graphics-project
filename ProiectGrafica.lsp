(defun proiectGAC2()     ; programul sterge cercurile care au raza mai mare de 5 si le coloreaza pe cele care au raza mai mica decat 2
; colorare cercuri care au raza mai mica de 2
(if ( setq ss (  ssget "X" '( ( 0 . "CIRCLE" ) ( -4 . "<" ) ( 40 . 2.0 ) ) )) ; conditia pentru cercuri care au raza mai mica decat 2 
  ( progn
  ( setq c 0 )   ;ii atribuie lui c valoarea 0
  ( setq culoare ( getint "Introduceti culoarea 1- rosu 2-galben 3-verde 4-turcoaz 5-albastru 6-mov"))
  (repeat ( sslength ss )
  ( setq
        tent ( entget ( ssname ss c ) ) ; obtinerea urmatoarei entitati din ss
	telem ( assoc 62 tent )     ; obtinerea listei cu culoarea entitatii
   )
    (if ( /= telem nill ) ; verific daca entitatea are campul culoare
     ( setq tent ( subst ( cons 62 culoare ) telem tent ))    ; modifica campul culoare
     ( setq tent ( append tent ( list ( cons 62 culoare ))))  ;adauga campul culoare
      )
    (entmod tent )  ;actualizarea definitiei entitatii
    (setq c ( 1+ c))  ;trece la entitatea urmatoare
    )
  )
  )

  (if (setq ss (ssget "x" '((0 . "CIRCLE")(-4 . ">") (40 . 5.0))))  ;daca este cerc si indeplineste conditia de a avea raza mai mare decat 5
    (progn  ; evalueaza expresiile pe rand si returneaza valoarea ultimei expresii
      (setq i 0)   ; seteaza variabila i cu 0
      (while (setq e (ssname ss i))   ; cat timp avem elemente in multimea selectata 
        (setq ccen (cdr (assoc 10 (entget e)))) ; ia cercul
        (entdel e)  ;sterge cercul 
        (setq i (1+ i))  ; se muta la urmatorul cerc
      )
    )
  )

  )