 PARAMETER zc, za, zac
 DO CASE
    CASE zc<=-4.00 
       zat = 7
    CASE zc<=-3.00 
       zat = 8
    CASE zc<=-2.50 
       zat = 8
    CASE zc<=-2.00 
       zat = 9
    CASE zc<=-1.75 
       zat = 10
    CASE zc<=-1.50 
       zat = 10
    CASE zc<=-1.25 
       zat = 13
    CASE zc<=-1.00 
       zat = 15
    CASE zc<=-0.75 
       zat = 20
    CASE zc<=-0.50 
       zat = 25
    CASE zc<=-0.25 
       zat = 35
    OTHERWISE
       zat = 90
 ENDCASE
 IF zat<90
    zat = ROUND((1+mrat/100)*zat, 0)
 ENDIF
 DO CASE
    CASE za+zat>180
       al1 = 0
       al2 = za+zat-180
       al3 = za-zat
       al4 = 180
    CASE za-zat<0
       al1 = 0
       al2 = za+zat
       al3 = 180-(zat-za)
       al4 = 180
    OTHERWISE
       al1 = za-zat
       al2 = za+zat
       al3 = 999
       al4 = 999
 ENDCASE
 IF (zac>=al1 .AND. zac<=al2) .OR. (zac>=al3 .AND. zac<=al4)
    RETURN .T.
 ELSE
    RETURN .F.
 ENDIF
*
