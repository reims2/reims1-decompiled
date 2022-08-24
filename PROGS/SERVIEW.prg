 SET CENTURY ON
 SET DELETED OFF
 SELECT STR(VAL(ssku(sku)), 6, 0) AS 'SKU', IIF(DELETED(), 'DELETED', '          ') AS 'Status', type, odsphere, odcylinder, odaxis, odadd, ossphere, oscylinder, osaxis, osadd, enterdate FROM GLSKU WHERE VAL(ssku(sku))>1 ORDER BY 1 INTO CURSOR serview
 SET DELETED ON
 ON KEY LABEL Ctrl+P DO ltp
 ON KEY LABEL Ctrl+F DO ftp
 fn = 'SV'+SUBSTR(DTOC(DATE()), 1, 2)+SUBSTR(DTOC(DATE()), 4, 2)+SUBSTR(DTOC(DATE()), 9)+'.PRN'
 almsg = mhead+' alert'
 DEFINE WINDOW brow FROM 1, 1 TO 45, 152 FONT 'Arial', 12 STYLE 'B' CLOSE
 ACTIVATE WINDOW brow
 BROWSE TITLE 'Serial number status -- Ctrl+P to print, Ctrl+F to file '+fn
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
