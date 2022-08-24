 PARAMETER wzalrtmess, wzalerttit
 PRIVATE alrtbtn
 m.alrtbtn = 2
 ON KEY LABEL ESC m.alrtbtn=1
 DEFINE WINDOW _qec1ij2t7 AT 0, 0 SIZE 8, 50 FONT 'MS Sans Serif', 10 STYLE 'B' FLOAT NOCLOSE TITLE wzalerttit NOMINIMIZE DOUBLE
 MOVE WINDOW _qec1ij2t7 CENTER
 ACTIVATE WINDOW NOSHOW _qec1ij2t7
 @ 2, (50-TXTWIDTH(wzalrtmess))/2 SAY wzalrtmess FONT 'MS Sans Serif', 10 STYLE 'B'
 @ 6, 18 GET m.alrtbtn FONT 'MS Sans Serif', 8 STYLE 'B' SIZE 1.769 , 8.667 , 1.333  PICTURE '@*HT \<Cancel ;\?\!\<OK'
 ACTIVATE WINDOW _qec1ij2t7
 READ CYCLE MODAL
 RELEASE WINDOW _qec1ij2t7
 ON KEY LABEL ESC
 RETURN m.alrtbtn=1
*
