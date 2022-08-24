 CLOSE DATABASES
 SELECT type, odsphere, odcylinder, odadd, COUNT(*) AS quantity FROM dispense WHERE BETWEEN(enterdate, mbegin, mend) GROUP BY 1, 2, 3, 4 INTO CURSOR dspsum
 ON KEY LABEL Ctrl+P DO ltp
 ON KEY LABEL Ctrl+F DO ftp
 fn = 'DS'+SUBSTR(DTOC(mend), 1, 2)+SUBSTR(DTOC(mend), 4, 2)+SUBSTR(DTOC(mend), 9)+'.PRN'
 cdb = SUBSTR(DTOC(mbegin), 1, 2)+'/'+SUBSTR(DTOC(mbegin), 4, 2)+'/'+SUBSTR(DTOC(mbegin), 9)
 cde = SUBSTR(DTOC(mend), 1, 2)+'/'+SUBSTR(DTOC(mend), 4, 2)+'/'+SUBSTR(DTOC(mend), 9)
 almsg = mhead+' alert'
 DEFINE WINDOW brow FROM 1, 1 TO 45, 152 FONT 'Arial', 12 STYLE 'B' CLOSE
 ACTIVATE WINDOW brow
 BROWSE TITLE 'Dispensed from '+cdb+' to '+cde+' -- Ctrl+P to print Ctrl+F to file '+fn
 RELEASE WINDOW brow
 ON KEY
*
PROCEDURE ftp
 IF  .NOT. galert('OK to print to file now?',almsg)
    LIST OFF TO &fn NOCONSOLE
    ON KEY
    RETURN
 ENDIF
*
PROCEDURE ltp
 IF  .NOT. galert('OK to print now?',almsg)
    SET PRINTER TO lpt1
    SET PRINTER ON
    ? 'Dispensed from '+cdb+' to '+cde
    SET PRINTER OFF
    LIST TO PRINTER OFF NOCONSOLE
    SET PRINTER TO
    RETURN
 ENDIF
*
