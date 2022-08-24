 PARAMETER ztype, zeye, zrxsd, zrxcd, zrxad, zrxss, zrxcs, zrxas, zods, zodc, zoda, zoss, zosc, zosa
 SET DECIMALS TO 5
 DO CASE
    CASE zeye='OD'
       ind = ABS(zrxsd-zods)+ABS(zrxcd-zodc)+IIF(ztype='B', ABS(zrxad-zoda)/10, 0)+IIF(ABS(rxad-odaxis)>=90, 180-ABS(rxad-odaxis), ABS(rxad-odaxis))/3600
       DO CASE
          CASE zods>0
             DO CASE
                CASE zrxsd-zods=(zodc-zrxcd)/2 .AND. zrxsd>zods .AND. ABS(zodc-zrxcd)<=1
                   ind = ind-0.55 
                CASE zrxsd=zods .AND. ABS(zrxcd-zodc)<=0.75  .AND. ABS(zrxcd-zodc)#0
                   ind = ind-0.12 
                CASE (zods>zrxsd .AND. zrxcd>zodc) .OR. (zods<zrxsd .AND. zrxcd<zodc)
                   IF ABS(zods-zrxsd)=ABS(zrxcd-zodc)
                      ind = ind-IIF(ABS(zrxcd-zodc)>=0.5 , (11.0/20), 0.30 )
                   ELSE
                      ind = ind-IIF(ABS(zrxcd-zodc)>=0.5 , (1.0/2), 0.25 )
                   ENDIF
             ENDCASE
          OTHERWISE
             DO CASE
                CASE zrxsd-zods=(zodc-zrxcd)/2 .AND. zrxsd>zods .AND. zrxsd>zods .AND. ABS(zodc-zrxcd)<=1
                   ind = ind-0.50 
                CASE zrxsd=zods .AND. ABS(zrxcd-zodc)<=0.75  .AND. ABS(zrxcd-zodc)#0
                   ind = ind-0.12 
                CASE (zods<zrxsd .AND. zodc>zrxcd) .OR. (zods>zrxsd .AND. zodc<zrxcd)
                   IF ABS(zods-zrxsd)=ABS(zrxcd-zodc)
                      ind = ind-IIF(ABS(zrxcd-zodc)>=0.5 , (11.0/20), 0.30 )
                   ELSE
                      ind = ind-IIF(ABS(zrxcd-zodc)>=0.5 , (1.0/2), 0.25 )
                   ENDIF
             ENDCASE
       ENDCASE
       IF ztype='B' .AND. zoda>zrxad
          ind = ind-(zoda-zrxad)/100
       ENDIF
       IF zrxsd>zods .AND. zrxsd>0
          ind = ind+0.25 
       ENDIF
    CASE zeye='OS'
       ind = ABS(zrxss-zoss)+ABS(zrxcs-zosc)+IIF(ztype='B', ABS(zrxas-zosa)/10, 0)+IIF(ABS(rxas-osaxis)>=90, 180-ABS(rxas-osaxis), ABS(rxas-osaxis))/3600
       DO CASE
          CASE zoss>0
             DO CASE
                CASE zrxss-zoss=(zosc-zrxcs)/2 .AND. zrxss>zoss .AND. ABS(zosc-zrxcs)<=1
                   ind = ind-0.55 
                CASE zrxss=zoss .AND. ABS(zrxcs-zosc)<=0.75  .AND. ABS(zrxcs-zosc)#0
                   ind = ind-0.12 
                CASE (zoss>zrxss .AND. zrxcs>zosc) .OR. (zoss<zrxss .AND. zrxcs<zosc)
                   IF ABS(zoss-zrxss)=ABS(zrxcs-zosc)
                      ind = ind-IIF(ABS(zrxcs-zosc)>=0.5 , (11.0/20), 0.30 )
                   ELSE
                      ind = ind-IIF(ABS(zrxcs-zosc)>=0.5 , (1.0/2), 0.25 )
                   ENDIF
             ENDCASE
          OTHERWISE
             DO CASE
                CASE zrxss-zoss=(zosc-zrxcs)/2 .AND. zrxss>zoss .AND. ABS(zosc-zrxcs)<=1
                   ind = ind-0.50 
                CASE zrxss=zoss .AND. ABS(zrxcs-zosc)<=0.75  .AND. ABS(zrxcs-zosc)#0
                   ind = ind-0.12 
                CASE (zoss>zrxss .AND. zrxcs>zosc) .OR. (zoss<zrxss .AND. zrxcs<zosc)
                   IF ABS(zoss-zrxss)=ABS(zrxcs-zosc)
                      ind = ind-IIF(ABS(zrxcs-zosc)>=0.5 , (11.0/20), 0.30 )
                   ELSE
                      ind = ind-IIF(ABS(zrxcs-zosc)>=0.5 , (1.0/2), 0.25 )
                   ENDIF
             ENDCASE
       ENDCASE
       IF ztype='B' .AND. zosa>zrxas
          ind = ind-(zosa-zrxas)/100
       ENDIF
       IF zrxss>zoss .AND. zrxss>0
          ind = ind+0.25 
       ENDIF
    CASE zeye='OU'
       ind = ABS(zrxsd-zods)+ABS(zrxcd-zodc)+IIF(ztype='B', ABS(zrxad-zoda)/10, 0)+IIF(ABS(rxad-odaxis)>=90, 180-ABS(rxad-odaxis), ABS(rxad-odaxis))/3600
       ind = ind+ABS(zrxss-zoss)+ABS(zrxcs-zosc)+IIF(ztype='B', ABS(zrxas-zosa)/10, 0)+IIF(ABS(rxas-osaxis)>=90, 180-ABS(rxas-osaxis), ABS(rxas-osaxis))/3600
       DO CASE
          CASE zods>0
             DO CASE
                CASE zrxsd-zods=(zodc-zrxcd)/2 .AND. zrxsd>zods .AND. ABS(zodc-zrxcd)<=1
                   ind = ind-0.55 
                CASE zrxsd=zods .AND. ABS(zrxcd-zodc)<=0.75  .AND. ABS(zrxcd-zodc)#0
                   ind = ind-0.12 
                CASE (zods>zrxsd .AND. zrxcd>zodc) .OR. (zods<zrxsd .AND. zrxcd<zodc)
                   IF ABS(zods-zrxsd)=ABS(zrxcd-zodc)
                      ind = ind-IIF(ABS(zrxcd-zodc)>=0.5 , (11.0/20), 0.30 )
                   ELSE
                      ind = ind-IIF(ABS(zrxcd-zodc)>=0.5 , (1.0/2), 0.25 )
                   ENDIF
             ENDCASE
          OTHERWISE
             DO CASE
                CASE zrxsd-zods=(zodc-zrxcd)/2 .AND. zrxsd>zods .AND. zrxsd>zods .AND. ABS(zodc-zrxcd)<=1
                   ind = ind-0.50 
                CASE zrxsd=zods .AND. ABS(zrxcd-zodc)<=0.75  .AND. ABS(zrxcd-zodc)#0
                   ind = ind-0.12 
                CASE (zods<zrxsd .AND. zodc>zrxcd) .OR. (zods>zrxsd .AND. zodc<zrxcd)
                   IF ABS(zods-zrxsd)=ABS(zrxcd-zodc)
                      ind = ind-IIF(ABS(zrxcd-zodc)>=0.5 , (11.0/20), 0.30 )
                   ELSE
                      ind = ind-IIF(ABS(zrxcd-zodc)>=0.5 , (1.0/2), 0.25 )
                   ENDIF
             ENDCASE
       ENDCASE
       DO CASE
          CASE zoss>0
             DO CASE
                CASE zrxss-zoss=(zosc-zrxcs)/2 .AND. zrxss>zoss .AND. ABS(zosc-zrxcs)<=1
                   ind = ind-0.55 
                CASE zrxss=zoss .AND. ABS(zrxcs-zosc)<=0.75  .AND. ABS(zrxcs-zosc)#0
                   ind = ind-0.12 
                CASE (zoss>zrxss .AND. zrxcs>zosc) .OR. (zoss<zrxss .AND. zrxcs<zosc)
                   IF ABS(zoss-zrxss)=ABS(zrxcs-zosc)
                      ind = ind-IIF(ABS(zrxcs-zosc)>=0.5 , (11.0/20), 0.30 )
                   ELSE
                      ind = ind-IIF(ABS(zrxcs-zosc)>=0.5 , (1.0/2), 0.25 )
                   ENDIF
             ENDCASE
          OTHERWISE
             DO CASE
                CASE zrxss-zoss=(zosc-zrxcs)/2 .AND. zrxss>zoss .AND. ABS(zosc-zrxcs)<=1
                   ind = ind-0.50 
                CASE zrxss=zoss .AND. ABS(zrxcs-zosc)<=0.75  .AND. ABS(zrxcs-zosc)#0
                   ind = ind-0.12 
                CASE (zoss>zrxss .AND. zrxcs>zosc) .OR. (zoss<zrxss .AND. zrxcs<zosc)
                   IF ABS(zoss-zrxss)=ABS(zrxcs-zosc)
                      ind = ind-IIF(ABS(zrxcs-zosc)>=0.5 , (11.0/20), 0.30 )
                   ELSE
                      ind = ind-IIF(ABS(zrxcs-zosc)>=0.5 , (1.0/2), 0.25 )
                   ENDIF
             ENDCASE
       ENDCASE
       IF ztype='B' .AND. zoda>zrxad
          ind = ind-(zoda-zrxad)/100
       ENDIF
       IF ztype='B' .AND. zosa>zrxas
          ind = ind-(zosa-zrxas)/100
       ENDIF
       IF zrxsd>zods .AND. zrxsd>0
          ind = ind+0.25 
       ENDIF
       IF zrxss>zoss .AND. zrxss>0
          ind = ind+0.25 
       ENDIF
 ENDCASE
 RETURN ind
*
