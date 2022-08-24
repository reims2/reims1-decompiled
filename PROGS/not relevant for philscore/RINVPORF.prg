 SELECT sku, type, odsphere, odcylinder, odaxis, odadd, ossphere, oscylinder, osaxis, osadd FROM glsku ORDER BY 2, 3, 4, 6 INTO CURSOR glinv
 ON KEY LABEL Ctrl+P DO ltp
 ON KEY LABEL Ctrl+F DO ftp
 fn = 'IN'+SUBSTR(DTOC(DATE()), 1, 2)+SUBSTR(DTOC(DATE()), 4, 2)+SUBSTR(DTOC(DATE()), 9)+'.PRN'
 almsg = mhead+' alert'
 DEFINE WINDOW brow FROM 1, 1 TO 45, 152 FONT 'Arial', 12 STYLE 'B' CLOSE
 ACTIVATE WINDOW brow
 BROWSE TITLE 'Eyeglass inventory sorted by type, OD sphere, cylinder and add -- Ctrl+P to print Ctrl+F to file '+fn
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
    ? 'Eyeglass inventory as of '+SUBSTR(DTOC(DATE()), 1, 2)+'/'+SUBSTR(DTOC(DATE()), 4, 2)+'/'+SUBSTR(DTOC(DATE()), 7)
    SET PRINTER OFF
    LIST TO PRINTER OFF NOCONSOLE
    SET PRINTER TO
    RETURN
 ENDIF
*
