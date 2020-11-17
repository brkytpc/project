<cfcomponent>
<cfheader name="Access-Control-Allow-Origin" value="*" />
<cfheader name="Access-Control-Allow-Methods" value="GET,POST" />
<cfheader name="Access-Control-Allow-Headers" value="Content-Type" />

<cfset result = StructNew()>

<cffunction name="add_query" access="remote" returntype="string" result="query_result" >
    <cftry>
        <cfquery datasource="workCubeDSN" name="add_query">        
            INSERT INTO KAYIT_EVRAK
            (GONDERICI,ALICI,TESLIM_TARIHI,TESLIM_ZAMAN,TESLIM_EDEN,TESLIM_ALAN,GONDERI_TIPI,DURUM,ACIKLAMA)
            VALUES 
            (   <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.gonderici#">,
                <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.alici#">,
                <cfqueryparam cfsqltype="cf_sql_date" value="#form.teslimTarihi#">,
                <cfqueryparam cfsqltype="cf_sql_time" value="#form.teslimZamani#">,
                 <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.teslimEden#">,
                <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.teslimAlan#">,
                <cfqueryparam cfsqltype="cf_sql_integer" value="#form.gonderiTipi#">,
                <cfqueryparam cfsqltype="cf_sql_integer" value="#form.durumAdi#">,
                <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.aciklama#">
            )              
          
              </cfquery>
              
              <cfset result.status =true>              
              <cfcatch type="any">
                <cfset result.status = false>
                <cfset result.error = cfcatch.message >
            </cfcatch>        
    </cftry>   
</cffunction>



<cffunction name="upd_query" access="remote" returntype="string" >
    
    <cfquery datasource="workCubeDSN" name="upd_query">        
        UPDATE KAYIT_EVRAK
        SET
        GONDERICI = <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.gonderici#">,
        ALICI = <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.alici#">,
        TESLIM_TARIHI =<cfqueryparam cfsqltype="cf_sql_date" value="#form.teslimTarihi#">,
        TESLIM_ZAMAN =<cfqueryparam cfsqltype="cf_sql_time" value="#form.teslimZamani#">,
        TESLIM_EDEN =<cfqueryparam cfsqltype="cf_sql_varchar" value="#form.teslimEden#">,
        TESLIM_ALAN =<cfqueryparam cfsqltype="cf_sql_varchar" value="#form.teslimAlan#">,
        GONDERI_TIPI =<cfqueryparam cfsqltype="cf_sql_integer" value="#form.gonderiTipi#">,
        DURUM =<cfqueryparam cfsqltype="cf_sql_integer" value="#form.durumAdi#">,
        ACIKLAMA = <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.aciklama#">
        WHERE ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#url.id#">
          </cfquery>
  

</cffunction>


<cffunction name="delete_query" access="remote" returntype="string"  result="query_result">
<cftry>
<cfquery datasource="workCubeDSN" name="delete_query">        
    DELETE FROM KAYIT_EVRAK
    WHERE 
    ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#url.id#">
  
      </cfquery>
<cfset result.status = true>
<cfset result.identitycol = #url.id#>
<cfcatch type="any">
    <cfset result.status = false>
    <cfset result.error = cfcatch.message >
</cfcatch>

</cftry>
</cffunction>


<cffunction name="add_status_parameter" access="remote" returntype="string" result="query_result" >
    <cftry>
        <cfquery datasource="workCubeDSN" name="add_status_parameter">        
            INSERT INTO CARGO_STATUS
            (STATUS_ID,STATUS_NAME)
            VALUES 
            (   <cfqueryparam cfsqltype="cf_sql_integer" value="#form.statusId#">,
                <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.statusName#">
                
            )              
          
              </cfquery>
              
              <cfset result.status =true>              
              <cfcatch type="any">
                <cfset result.status = false>
                <cfset result.error = cfcatch.message >
            </cfcatch>        
    </cftry>   
</cffunction>

<cffunction name="delete_status_parameter" access="remote" returntype="string"  result="query_result">
    <cftry>
    <cfquery datasource="workCubeDSN" name="delete_status_parameter">        
        DELETE FROM CARGO_STATUS
        WHERE 
        STATUS_ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#url.id#">
      
          </cfquery>
    <cfset result.status = true>
    <cfset result.identitycol = #url.id#>
    <cfcatch type="any">
        <cfset result.status = false>
        <cfset result.error = cfcatch.message >
    </cfcatch>
    
    </cftry>
    </cffunction>

    <cffunction name="upd_status_parameter" access="remote" returntype="string" >
    
        <cfquery datasource="workCubeDSN" name="upd_status_parameter">        
            UPDATE CARGO_STATUS
            SET
            STATUS_ID = <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.statusId#">,
            STATUS_NAME = <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.statusName#">            
            WHERE STATUS_ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#url.id#">
              </cfquery>
      
    
    </cffunction>








    <cffunction name="add_cargo_parameter" access="remote" returntype="string" result="query_result" >
        <cftry>
            <cfquery datasource="workCubeDSN" name="add_cargo_parameter">        
                INSERT INTO CARGO_TYPE
                (CARGO_ID,CARGO_NAME)
                VALUES 
                (   <cfqueryparam cfsqltype="cf_sql_integer" value="#form.cargoId#">,
                    <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.cargoName#">
                    
                )              
              
                  </cfquery>
                  
                  <cfset result.status =true>              
                  <cfcatch type="any">
                    <cfset result.status = false>
                    <cfset result.error = cfcatch.message >
                </cfcatch>        
        </cftry>   
    </cffunction>
    
    <cffunction name="delete_cargo_parameter" access="remote" returntype="string"  result="query_result">
        <cftry>
        <cfquery datasource="workCubeDSN" name="delete_cargo_parameter">        
            DELETE FROM CARGO_TYPE
            WHERE 
            CARGO_ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#url.id#">
          
              </cfquery>
        <cfset result.status = true>
        <cfset result.identitycol = #url.id#>
        <cfcatch type="any">
            <cfset result.status = false>
            <cfset result.error = cfcatch.message >
        </cfcatch>
        
        </cftry>
        </cffunction>
    
        <cffunction name="upd_cargo_parameter" access="remote" returntype="string" >
        
            <cfquery datasource="workCubeDSN" name="upd_cargo_parameter">        
                UPDATE CARGO_TYPE
                SET
                CARGO_ID = <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.cargoId#">,
                CARGO_NAME = <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.cargoName#">            
                WHERE CARGO_ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#url.id#">
                  </cfquery>
          
        
        </cffunction>


<!---

<cffunction name="del_query" access="public"  > 
   
    <cftry>
        <cfquery name="del_query" datasource="workCubeDSN" result="query_result">	
            DELETE
            FROM
                PROTEIN_WIDGETS                
            WHERE
                WIDGET_ID =  <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.WIDGET_ID#">  
                AND SITE = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.SITE#">
        </cfquery>
        <cfset result.status = true>
        <cfset result.identitycol = #arguments.WIDGET_ID#>
        <cfcatch type="any">
            <cfset result.status = false>
            <cfset result.error = cfcatch.message >
        </cfcatch>
    </cftry>
    
</cffunction>
--->


</cfcomponent>