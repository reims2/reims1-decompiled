 PARAMETER za, zt
 DO CASE
    CASE za+zt>180
       al1 = 0
       al2 = za+zt-180
       al3 = za-zt
       al4 = 180
    CASE za-zt<0
       al1 = 0
       al2 = za+zt
       al3 = 180-(zt-za)
       al4 = 180
    OTHERWISE
       al1 = za-zt
       al2 = za+zt
       al3 = 999
       al4 = 999
 ENDCASE
*
