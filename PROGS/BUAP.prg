 process = .T.
 almsg = mhead+' alert'
 IF  .NOT. galert('OK to back up now?',almsg)
    CLOSE DATABASES
    ftz = PUTFILE('Backup', bun+'.zip')
    IF EMPTY(ftz)
       process = .F.
       RETURN
    ENDIF
    !pkzip &ftz *.dbf *.cdx 
    USE bulog
    APPEND BLANK
    REPLACE budate WITH DATE()
    CLOSE DATABASES
 ENDIF
 SET MESSAGE TO ' '
 process = .F.
*
PROCEDURE disktest
 PARAMETER dletter
 DO WHILE .T.
    IF  .NOT. isdiskin(dletter)
       RETURN .T.
    ELSE
       IF galert('Drive '+dletter+': not ready! Try again?',almsg)
          RETURN .F.
       ENDIF
    ENDIF
 ENDDO
*
PROCEDURE isdiskin
 PARAMETER dletter
 PRIVATE diskerr, errfunc, fhnd
 errfunc = ON('ERROR')
 diskerr = .F.
 ON ERROR diskerr=.T.
 fhnd = FCREATE(dletter+':test.tst')
 ON ERROR &errfunc
 IF  .NOT. diskerr
    = FCLOSE(fhnd)
    DELETE FILE (dletter+':test.tst')
 ENDIF
 RETURN diskerr
*
