<cfquery datasource="workCubeDSN" name="statusData">        
    SELECT *
  FROM CARGO_STATUS  
      </cfquery>

  
  <cfquery datasource="workCubeDSN" name="cargoTypeData">        
    SELECT * FROM CARGO_TYPE 
      </cfquery>


<cfquery datasource="workCubeDSN" name="listData">   
    SELECT *
 FROM KAYIT_EVRAK
 LEFT JOIN CARGO_TYPE
 ON KAYIT_EVRAK.GONDERI_TIPI=CARGO_TYPE.CARGO_ID
 LEFT JOIN CARGO_STATUS
 ON KAYIT_EVRAK.DURUM=CARGO_STATUS.STATUS_ID;
     </cfquery>
 

 
