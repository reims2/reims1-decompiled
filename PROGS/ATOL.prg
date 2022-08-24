 PARAMETER zrxc
 DO CASE
    CASE zrxc<=-4.00 
       RETURN 7
    CASE zrxc<=-3.00 
       RETURN 8
    CASE zrxc<=-2.50 
       RETURN 8
    CASE zrxc<=-2.00 
       RETURN 9
    CASE zrxc<=-1.75 
       RETURN 10
    CASE zrxc<=-1.50 
       RETURN 10
    CASE zrxc<=-1.25 
       RETURN 13
    CASE zrxc<=-1.00 
       RETURN 15
    CASE zrxc<=-0.75 
       RETURN 20
    CASE zrxc<=-0.50 
       RETURN 25
    CASE zrxc<=-0.25 
       RETURN 35
    OTHERWISE
       RETURN 90
 ENDCASE
*
