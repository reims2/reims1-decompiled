*
PROCEDURE speq
 PARAMETER rxs, rxc, rxa
 STORE 10 TO s1, s2, s3, c1, c2, c3
 DO CASE
    CASE rxc<=-1.5 
       c1 = rxc+0.5 
       s1 = rxs-0.25 
       c2 = rxc+1
       s2 = rxs-0.5 
       c3 = rxc+1.5 
       s3 = rxs-0.75 
    CASE rxc<=-1
       c1 = rxc+0.5 
       s1 = rxs-0.25 
       c2 = rxc+1
       s2 = rxs-0.5 
    CASE rxc<=-0.5 
       c1 = rxc+0.5 
       s1 = rxs-0.25 
 ENDCASE
*
