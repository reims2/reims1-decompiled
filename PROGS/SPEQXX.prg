*
PROCEDURE speqxx
 PARAMETER rxs, rxc, rxa
 mrxs = rxs
 mrxc = rxc
 mrxa = rxa
 wrxs = rxs
 wrxc = rxc
 wrxa = rxa
 USE speq
 SET SAFETY OFF
 ZAP
 SET SAFETY ON
 = axrng(rxa,atol(mrxc))
 APPEND BLANK
 REPLACE sphere WITH mrxs, cylinder WITH mrxc, axis WITH mrxa, axfm1 WITH al1, axto1 WITH al2, axfm2 WITH al3, axto2 WITH al4
 DO WHILE wrxc<0
    c1 = wrxc+0.5 
    IF c1>0
       EXIT
    ENDIF
    s1 = wrxs-0.25 
    = axrng(wrxa,atol(c1))
    APPEND BLANK
    REPLACE sphere WITH s1, cylinder WITH c1, axis WITH wrxa, axfm1 WITH al1, axto1 WITH al2, axfm2 WITH al3, axto2 WITH al4
    wrxc = c1
    wrxs = s1
 ENDDO
 GOTO TOP
 BROWSE FIELDS sphere, cylinder, axfm1 :H = 'Axis acceptable from', axto1 :H = ' to ', axfm2 :H = 'or from', axto2 :H = ' to' NOMENU TITLE 'Spherical equivalents of '+STR(mrxs, 6, 2)+' = '+STR(mrxc, 6, 2)+' ax '+STR(mrxa, 3, 0)
 USE
*
