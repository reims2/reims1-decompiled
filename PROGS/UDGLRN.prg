 IF  .NOT. galert('OK to import and update now?',mhead+' alert')
    process = .T.
    CLOSE DATABASES
    adflag = .F.
    udf = .F.
    afail = .F.
    USE readd
    IF RECCOUNT()=1 .AND. EMPTY(sku)
       CLOSE DATABASES
       SET EXCLUSIVE ON
       USE readd
       SET SAFETY OFF
       ZAP
       filein = GETFILE('dbf', 'Re-used number file to import', 'Readd', 2)
       IF EMPTY(filein)
          process = .F.
          RETURN
       ENDIF
       APPE FROM &filein
       SET EXCLUSIVE OFF
       SET SAFETY ON
       adflag = .T.
       = udm()
    ELSE
       = udm()
    ENDIF
    IF afail
       WAIT CLEAR
       process = .F.
       RETURN
    ENDIF
    IF udf
       SET DELETED ON
       CLOSE DATABASES
       SET DELETED OFF
       SET SAFETY OFF
       SELECT sku, VAL(SUBSTR(sku, AT(':', sku)+1)), COUNT(*) FROM glsku WHERE DELETED() AND VAL(SUBSTR(sku, AT(':', sku)+1))>1 GROUP BY 2 INTO DBF DELETED
       SET DELETED ON
       SET EXCLUSIVE OFF
       SET SAFETY ON
       IF adflag
          DO bu.spr
       ENDIF
    ENDIF
 ENDIF
 CLOSE DATABASES
 WAIT CLEAR
 process = .F.
*
PROCEDURE disktest
 PARAMETER dletter
 DO WHILE .T.
    IF  .NOT. isdiskin(dletter)
       RETURN .T.
    ELSE
       IF galert('Drive '+dletter+': not ready! Try again?',mheada+' alert')
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
PROCEDURE udm
 CLOSE DATABASES
 SET DELETED OFF
 SELECT 0
 USE glsku ORDER skuserial
 SELECT 0
 USE readd
 SET RELATION TO VAL(SUBSTR(sku, AT(':', sku)+1)) INTO glsku
 ra = RECCOUNT()-1
 c = 0
 WAIT WINDOW NOWAIT 'Checking file to be sure all update records match'
 SCAN
    SELECT glsku
    IF  .NOT. DELETED() .AND.  .NOT. EOF() .AND.  .NOT. EMPTY(sku)
       c = c+1
    ENDIF
 ENDSCAN
 SET DELETED ON
 IF c>0
    IF  .NOT. galert('This is a problem - continue anyway? ','Update found '+STR(c, 3, 0)+' undeleted records to replace')
       SET DELETED OFF
       SELECT readd
       GOTO TOP
       WAIT WINDOW NOWAIT 'Updating master file with re-used numbers'
       c = 0
       SCAN
          SCATTER TO ud
          SELECT glsku
          IF  .NOT. EOF() .AND.  .NOT. EMPTY(sku)
             RECALL
             GATHER FROM ud
             c = c+1
          ENDIF
          SELECT readd
       ENDSCAN
       CLOSE DATABASES
       SET EXCLUSIVE ON
       SET SAFETY OFF
       USE readd
       ZAP
       APPEND BLANK
       SET EXCLUSIVE OFF
       SET SAFETY ON
       udf = .T.
       WAIT WINDOW 'Update of '+STR(c, 4, 0)+' records complete '+STR(ra, 4, 0)+' input'
       RETURN .T.
    ELSE
       SET EXCLUSIVE ON
       USE readd
       BROWSE FOR  .NOT. DELETED('glsku')
       WAIT WINDOW 'Update not performed'
       SET SAFETY OFF
       ZAP
       APPEND BLANK
       SET SAFETY ON
       SET EXCLUSIVE OFF
       RETURN .F.
    ENDIF
 ELSE
    SET DELETED OFF
    SELECT readd
    GOTO TOP
    WAIT WINDOW NOWAIT 'Updating master file with re-used numbers'
    c = 0
    SCAN
       SCATTER TO ud
       SELECT glsku
       IF  .NOT. EOF() .AND.  .NOT. EMPTY(sku)
          RECALL
          GATHER FROM ud
          c = c+1
       ENDIF
       SELECT readd
    ENDSCAN
    CLOSE DATABASES
    SET EXCLUSIVE ON
    SET SAFETY OFF
    USE readd
    ZAP
    APPEND BLANK
    SET EXCLUSIVE OFF
    SET SAFETY ON
    udf = .T.
    WAIT WINDOW 'Update of '+STR(c, 4, 0)+' records complete '+STR(ra, 4, 0)+' input'
    RETURN .T.
 ENDIF
*
