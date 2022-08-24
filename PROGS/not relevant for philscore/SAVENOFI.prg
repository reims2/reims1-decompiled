*
PROCEDURE savenofi
 SELECT 0
 USE notfound
 APPEND BLANK
 REPLACE type WITH mtype
 REPLACE odsphere WITH rxsd
 REPLACE odcylinder WITH rxcd
 REPLACE odaxis WITH rxad
 REPLACE odadd WITH rxdadd
 REPLACE ossphere WITH rxss
 REPLACE oscylinder WITH rxcs
 REPLACE osaxis WITH rxas
 REPLACE osadd WITH rxsadd
 REPLACE enterdate WITH DATE()
 REPLACE sku WITH 'Not in inventory'
 USE
 RETURN
*
