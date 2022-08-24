*************
*
*       Type:   FoxPro 2.5+ [encr dbg] - program compiled code
*       Size:  1385 B
*       Date:  2009.03.23  16:22
*         CP:  00 .. not marked
*          80  lines
*
*************

 CLOSE DATABASES
 CLEAR ALL
 CLEAR
 SET TALK OFF
 SET ESCAPE OFF
 SET DELETED ON
 SET STATUS TIMEOUT TO 10
 SET SYSMENU TO
 SET EXCLUSIVE OFF
 SET REPROCESS TO 1
 SET RESOURCE TO foxuser
 SET HELP OFF
 SET HELP ON
 SET FUNCTION 2 TO
 SET FUNCTION 3 TO
 SET FUNCTION 4 TO
 SET FUNCTION 5 TO
 SET FUNCTION 6 TO
 SET FUNCTION 7 TO
 SET FUNCTION 8 TO
 SET FUNCTION 9 TO
 SET BELL OFF
 PUBLIC zrevz, mx, process, errmsg, rdfile, mhead, mheada, bul
 zrevz = '9.2c'
 mx = .F.
 process = .F.
 IF FILE('reimshlp.dbf')
    rhfile = .T.
    SET HELP TO reimshlp.dbf
 ELSE
    rhfile = .F.
 ENDIF
 IF FILE('rdtrak.dbf')
    rdfile = .T.
 ELSE
    rdfile = .F.
 ENDIF
 IF FILE('dspbu.dbf')
    SET EXCLUSIVE ON
    SET SAFETY OFF
    USE dspbu
    IF RECCOUNT()>1
       COPY TO dispense.bak
       ZAP
    ENDIF
    CLOSE DATABASES
    SET EXCLUSIVE OFF
    SET SAFETY ON
 ENDIF
 mheadb = ' '
 bul = .F.
 IF FILE('bulog.dbf')
    USE bulog
    IF FCOUNT('bulog')=2
       bul = .T.
       mheadb = ' *** '+location
    ENDIF
    CLOSE DATABASES
 ENDIF
 IF  .NOT. FILE('notfound.dbf')
    USE dispense
    COPY TO notfound STRUCTURE
    CLOSE DATABASES
 ENDIF
 mhead = 'Richmond Eyeglass Inventory Matching System'
 mheada = 'Richmond Eyeglass Inventory Matching System'+mheadb
 PUSH MENU _MSYSMENU
 MODIFY WINDOW screen TITLE mheada
 DO reims.mpr
 READ VALID mx
 CLEAR READ
 CLOSE DATABASES
 CLEAR
 SET TALK ON
 SET DELETED OFF
 SET SYSMENU TO DEFAULT
 MODIFY WINDOW screen TITLE 'Microsoft FoxPro'
 POP MENU _MSYSMENU
 RETURN
*
