*
PROCEDURE qtrinc
 PARAMETER zntq
 neg = .F.
 IF zntq<0
    neg = .T.
    zntq = zntq*-1
 ENDIF
 IF zntq<=1
    DO CASE
       CASE zntq>=0.875 
          zntq = 1
       CASE zntq>=0.625 
          zntq = 0.75 
       CASE zntq>=0.375 
          zntq = 0.5 
       CASE zntq>=0.125 
          zntq = 0.25 
       OTHERWISE
          zntq = 0
    ENDCASE
 ELSE
    DO CASE
       CASE (zntq%INT(zntq))>=0.875 
          zntq = INT(zntq)+1
       CASE (zntq%INT(zntq))>=0.625 
          zntq = INT(zntq)+0.75 
       CASE (zntq%INT(zntq))>=0.375 
          zntq = INT(zntq)+0.5 
       CASE (zntq%INT(zntq))>=0.125 
          zntq = INT(zntq)+0.25 
       OTHERWISE
          zntq = INT(zntq)
    ENDCASE
 ENDIF
 IF neg
    zntq = zntq*-1
 ENDIF
 RETURN zntq
*
