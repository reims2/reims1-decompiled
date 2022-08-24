 SET CENTURY ON
 SELECT type, odsphere, odcylinder, odadd, COUNT(*) AS quantity FROM glsku GROUP BY 1, 2, 3, 4 INTO CURSOR invsum
 ON KEY LABEL Ctrl+P DO ltp
 ON KEY LABEL Ctrl+F DO ftp
 fn = 'IS'+SUBSTR(DTOC(DATE()), 1, 2)+SUBSTR(DTOC(DATE()), 4, 2)+SUBSTR(DTOC(DATE()), 9)+'.PRN'
 almsg = mhead+' alert'
 DEFINE WINDOW brow FROM 1, 1 TO 45, 152 FONT 'Arial', 12 STYLE 'B' CLOSE
 ACTIVATE WINDOW brow
 BROWSE TITLE 'Eyeglass inventory summary by type, OD sphere,cylinder and add -- Ctrl+P to print, Ctrl+F to file '+fn
 RELEASE WINDOW brow
 ON KEY
 SET CENTURY OFF
 RETURN
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
    ? 'Eyeglass inventory summary as of '+SUBSTR(DTOC(DATE()), 1, 2)+'/'+SUBSTR(DTOC(DATE()), 4, 2)+'/'+SUBSTR(DTOC(DATE()), 7)
    SET PRINTER OFF
    LIST TO PRINTER OFF NOCONSOLE
    SET PRINTER TO
    RETURN
 ENDIF
*
