 CLOSE DATABASES
 SELECT 0
 USE rdtrak
 SELECT 0
 USE rdadd
 SELECT 0
 SET EXCLUSIVE ON
 SET SAFETY OFF
 USE inv
 ZAP
 SET EXCLUSIVE OFF
 SET SAFETY ON
 SELECT 0
 USE rdinv
 SCAN
    SELECT rdtrak
    COUNT FOR sphere=rdinv.sphere .AND. dateused>rdinv.dateinv TO counter
    SELECT rdadd
    SUM FOR sphere=rdinv.sphere .AND. dateadded>rdinv.dateinv added TO madd
    SELECT inv
    APPEND BLANK
    REPLACE sphere WITH rdinv.sphere, begininv WITH rdinv.quantity, used WITH counter, dateinv WITH rdinv.dateinv, added WITH madd, current WITH rdinv.quantity-counter+madd
    SELECT rdinv
 ENDSCAN
 SELECT inv
 SET SAFETY OFF
 INDEX ON sphere TAG sphere
 SET SAFETY ON
 ON KEY LABEL Ctrl+P DO ltp
 BROWSE FIELDS sphere, begininv :H = 'Beginning inventory', added, used, current :H = 'Current inventory', dateinv :H = 'Last inventory date' TITLE 'Readers inventory'
 ON KEY
 RETURN
*
PROCEDURE ltp
 LIST TO PRINTER OFF NOCONSOLE
 RETURN
*
