
<cfcomponent extends="cfc.queryJSONConverter">

    <cfheader name="Access-Control-Allow-Origin" value="*" />
    <cfheader name="Access-Control-Allow-Methods" value="GET,POST" />
    <cfheader name="Access-Control-Allow-Headers" value="Content-Type" /> 

    <cfset dsn = application.systemParam.systemParam().dsn>
    <cfset result = StructNew()>

    <cffunction name="get_general_definitions" access="remote" returntype="string" returnFormat="json">
        <cftry>
            <cfquery name="get_general_definitions" datasource="#dsn#">        	
                SELECT
                    SITE_ID AS ID,DOMAIN,STATUS,MAINTENANCE_MODE,PRIMARY_DATA
                FROM
                    PROTEIN_SITES
                WHERE
                    SITE_ID =  <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.id#">  
            </cfquery>
            <cfset result.status = true>
            <cfset result.identitycol = #arguments.id#>
            <cfset result.data = this.returnData(replace(serializeJSON(get_general_definitions),"//",""))>
            <cfcatch type="any">
                <cfset result.status = false>
                <cfset result.error = cfcatch.message >
            </cfcatch>  
        </cftry>
        <cfreturn Replace(SerializeJSON(result),'//','')>
    </cffunction>

    <cffunction name="get_lang_and_money" access="remote" returntype="string" returnFormat="json">
        <cftry>
            <cfquery name="get_lang_and_money" datasource="#dsn#">        	
                SELECT
                    SITE_ID AS ID,COMPANY,ZONE_DATA
                FROM
                    PROTEIN_SITES
                WHERE
                    SITE_ID =  <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.id#">  
            </cfquery>
            <cfset result.status = true>
            <cfset result.identitycol = #arguments.id#>
            <cfset result.data = this.returnData(replace(serializeJSON(get_lang_and_money),"//",""))>
            <cfcatch type="any">
                <cfset result.status = false>
                <cfset result.error = cfcatch.message >
            </cfcatch>  
        </cftry>
        <cfreturn Replace(SerializeJSON(result),'//','')>
    </cffunction>

    <cffunction name="get_access" access="remote" returntype="string" returnFormat="json">
        <cftry>
            <cfquery name="get_access" datasource="#dsn#">        	
                SELECT
                    SITE_ID AS ID,ACCESS_DATA
                FROM
                    PROTEIN_SITES
                WHERE
                    SITE_ID =  <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.id#">  
            </cfquery>
            <cfset result.status = true>
            <cfset result.identitycol = #arguments.id#>
            <cfset result.data = this.returnData(replace(serializeJSON(get_access),"//",""))>
            <cfcatch type="any">
                <cfset result.status = false>
                <cfset result.error = cfcatch.message >
            </cfcatch>  
        </cftry>
        <cfreturn Replace(SerializeJSON(result),'//','')>
    </cffunction>

    <cffunction name="get_theme" access="remote" returntype="string" returnFormat="json">
        <cftry>
            <cfquery name="get_theme" datasource="#dsn#">        	
                SELECT
                    SITE_ID AS ID,THEME_DATA
                FROM
                    PROTEIN_SITES
                WHERE
                    SITE_ID =  <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.id#">  
            </cfquery>
            <cfset result.status = true>
            <cfset result.identitycol = #arguments.id#>
            <cfset result.data = this.returnData(replace(serializeJSON(get_theme),"//",""))>
            <cfcatch type="any">
                <cfset result.status = false>
                <cfset result.error = cfcatch.message >
            </cfcatch>  
        </cftry>
        <cfreturn Replace(SerializeJSON(result),'//','')>
    </cffunction>

    <cffunction name="get_template" access="remote" returntype="string" returnFormat="json">
        <cftry>
            <cfquery name="get_template" datasource="#dsn#">        	
                SELECT
                    TEMPLATE_ID AS ID,SITE,STATUS,TYPE,TITLE,DESIGN_DATA
                FROM
                    PROTEIN_TEMPLATES
                WHERE
                    TEMPLATE_ID =  <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.id#">  
            </cfquery>
            <cfset result.status = true>
            <cfset result.identitycol = #arguments.id#>
            <cfset result.data = this.returnData(replace(serializeJSON(get_template),"//",""))>
            <cfcatch type="any">
                <cfset result.status = false>
                <cfset result.error = cfcatch.message >
            </cfcatch>  
        </cftry>
        <cfreturn Replace(SerializeJSON(result),'//','')>
    </cffunction>

    <cffunction name="get_page" access="remote" returntype="string" returnFormat="json">
        <cftry>
            <cfquery name="get_page" datasource="#dsn#">        	
                SELECT
                    PAGE_ID AS ID,FRIENDLY_URL,TITLE,SITE,PAGE_DATA,TEMPLATE_BODY,TEMPLATE_INSIDE,STATUS
                FROM
                    PROTEIN_PAGES
                WHERE
                    PAGE_ID =  <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.id#">  
            </cfquery>
            <cfset result.status = true>
            <cfset result.identitycol = #arguments.id#>
            <cfset result.data = this.returnData(replace(serializeJSON(get_page),"//",""))>
            <cfcatch type="any">
                <cfset result.status = false>
                <cfset result.error = cfcatch.message >
            </cfcatch>  
        </cftry>
        <cfreturn Replace(SerializeJSON(result),'//','')>
    </cffunction>

    <cffunction name="get_widget" access="remote" returntype="string" returnFormat="json">
        <cftry>
            <cfquery name="get_widget" datasource="#dsn#">        	
                SELECT
                    PW.WIDGET_ID AS ID,
                    PW.SITE,
                    PW.TITLE,
                    PW.STATUS,
                    PW.WIDGET_NAME,
                    PW.WIDGET_DATA,
                    CW.WIDGET_FILE_PATH,
                    CW.WIDGET_TITLE,
                    CW.WIDGET_DESCRIPTION,
                    CW.WIDGET_AUTHOR,
                    CW.WIDGET_VERSION
                FROM
                    PROTEIN_WIDGETS PW
	                LEFT JOIN WRK_WIDGET CW ON PW.WIDGET_NAME = CW.WIDGETID
                WHERE
                    WIDGET_ID =  <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.id#">  
            </cfquery>
            <cfset result.status = true>
            <cfset result.identitycol = #arguments.id#>
            <cfset result.data = this.returnData(replace(serializeJSON(get_widget),"//",""))>
            <cfcatch type="any">
                <cfset result.status = false>
                <cfset result.error = cfcatch.message >
            </cfcatch>  
        </cftry>
        <cfreturn Replace(SerializeJSON(result),'//','')>
    </cffunction>

    <cffunction name="get_widget_info" access="remote" returntype="string" returnFormat="json">
        <cfset arguments = deserializeJSON(getHttpRequestData().content)> 
        <cftry>
            <cfquery name="get_widget_info" datasource="#dsn#">        	
                SELECT
                    CW.WIDGETID,
                    CW.WIDGET_TITLE,
                    CW.WIDGET_DESCRIPTION,
                    CW.WIDGET_AUTHOR,
                    CW.WIDGET_VERSION
                FROM
                   WRK_WIDGET CW 
                WHERE
                    CW.WIDGETID =  <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.id#">  
            </cfquery>
            <cfset result.status = true>
            <cfset result.identitycol = #arguments.id#>
            <cfset result.data = this.returnData(replace(serializeJSON(get_widget_info),"//",""))>
            <cfcatch type="any">
                <cfset result.status = false>
                <cfset result.error = cfcatch.message >
            </cfcatch>  
        </cftry>
        <cfreturn Replace(SerializeJSON(result),'//','')>
    </cffunction>

    <cffunction name="get_menu" access="remote" returntype="string" returnFormat="json">
        <cftry>
            <cfquery name="get_menu" datasource="#dsn#">        	
                SELECT
                    MENU_ID AS ID,
                    SITE,
                    MENU_NAME,
                    MENU_STATUS,
                    IS_DEFAULT,
                    MENU_DATA
                FROM
                    PROTEIN_MENUS
                WHERE
                    MENU_ID =  <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.id#">  
            </cfquery>
            <cfset result.status = true>
            <cfset result.identitycol = #arguments.id#>
            <cfset result.data = this.returnData(replace(serializeJSON(get_menu),"//",""))>
            <cfcatch type="any">
                <cfset result.status = false>
                <cfset result.error = cfcatch.message >
            </cfcatch>  
        </cftry>
        <cfreturn Replace(SerializeJSON(result),'//','')>
    </cffunction>
    
    <cffunction name="get_xml_settings" access="remote" returntype="string" returnFormat="json">
        <cfset arguments = deserializeJSON(getHttpRequestData().content)>    
        <cftry>                   
            <cffile action="read" file="#application.systemParam.INDEX_FOLDER#objects2/xml/#arguments.XML#" variable="xmlString"> 
            <cfscript>
                function xmlToStruct(xml x) {
                    var s = {};

                    if(xmlGetNodeType(x) == "DOCUMENT_NODE") {
                        s[structKeyList(x)] = xmlToStruct(x[structKeyList(x)]);    
                    }

                    if(structKeyExists(x, "xmlAttributes") && !structIsEmpty(x.xmlAttributes)) { 
                        s.attributes = {};
                        for(var item in x.xmlAttributes) {
                            s.attributes[item] = x.xmlAttributes[item];        
                        }
                    }
                    
                    if(structKeyExists(x, "xmlText") && len(trim(x.xmlText))) {
                    s.value = x.xmlText;
                    }

                    if(structKeyExists(x, "xmlChildren") && arrayLen(x.xmlChildren)) {
                        for(var i=1; i<=arrayLen(x.xmlChildren); i++) {
                            if(structKeyExists(s, x.xmlchildren[i].xmlname)) { 
                                if(!isArray(s[x.xmlChildren[i].xmlname])) {
                                    var temp = s[x.xmlchildren[i].xmlname];
                                    s[x.xmlchildren[i].xmlname] = [temp];
                                }
                                arrayAppend(s[x.xmlchildren[i].xmlname], xmlToStruct(x.xmlChildren[i]));                
                            } else {
                                //before we parse it, see if simple
                                if(structKeyExists(x.xmlChildren[i], "xmlChildren") && arrayLen(x.xmlChildren[i].xmlChildren)) {
                                    s[x.xmlChildren[i].xmlName] = xmlToStruct(x.xmlChildren[i]);
                                } else if(structKeyExists(x.xmlChildren[i],"xmlAttributes") && !structIsEmpty(x.xmlChildren[i].xmlAttributes)) {
                                    s[x.xmlChildren[i].xmlName] = xmlToStruct(x.xmlChildren[i]);
                                } else {
                                    s[x.xmlChildren[i].xmlName] = x.xmlChildren[i].xmlText;
                                }
                            }
                        }
                    }
                    
                    return s;
                }

            </cfscript>   
            <cfset xmlData = xmlParse(xmlString)>   
            <cfset jsonData = xmlToStruct(xmlData)>
            <cfset result.status = true>
            <cfset result.identitycol = #arguments.XML#>
            <cfset result.data = replace(serializeJSON(jsonData.OBJECT_PROPERTIES),"//","")>
            <cfcatch type="any">
                <cfset result.status = false>
                <cfset result.error = cfcatch >
            </cfcatch>  
        </cftry>
        <cfreturn Replace(SerializeJSON(result),'//','')>
    </cffunction>

    <cffunction name="general_definitions_add" access="remote" returntype="string" returnFormat="json"> 
        <cfset arguments = deserializeJSON(getHttpRequestData().content)>
        <cftry>
        	<cfquery name="insert_site_step_one" datasource="#dsn#" result="query_result">	
                INSERT INTO
                    PROTEIN_SITES  (DOMAIN,STATUS,MAINTENANCE_MODE,PRIMARY_DATA,RECORD_DATE,RECORD_EMP,RECORD_IP)
                VALUES
                	(
                        <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.DOMAIN#">,
                        <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.STATUS#">,
                        <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.MAINTENANCE_MODE#">,
                        <cfqueryparam cfsqltype="cf_sql_varchar" value="#Replace(SerializeJSON(arguments.PRIMARY_DATA[1]),'//','')#">,
                        <cfqueryparam value="#now()#" cfsqltype="cf_sql_date">,	
                        <cfqueryparam value="#session.ep.userid#" cfsqltype="cf_sql_integer">,
                        <cfqueryparam value="#cgi.remote_addr#" cfsqltype="cf_sql_varchar">
                    )
            </cfquery>
            <cfset result.status = true>
            <cfset result.identitycol = #query_result.identitycol#>
            <cfif len(result.identitycol)>
                <cfset SITE_PATH ="#application.systemParam.DOWNLOAD_FOLDER#AddOns\yazilimsa\Protein\reactor">
                <cfset cmd = "C:\Windows\system32\cmd.exe">
                <cfset iis_app = "/c C:\Windows\System32\inetsrv\appcmd.exe">
                <cfset param = "add site /name:""#arguments.DOMAIN#"" /bindings:http://#arguments.DOMAIN#:80 /physicalpath:""#SITE_PATH#"" ">
                <cfexecute name="#cmd#" arguments="#iis_app# #param#" variable="console_result" timeout="60"></cfexecute>
            </cfif>
            <cfcatch type="any">
                <cfset result.status = false>
                <cfset result.error = cfcatch.message >
            </cfcatch>
        </cftry>
        <cfreturn Replace(SerializeJSON(result),'//','')>
	</cffunction>

    <cffunction name="general_definitions_upd" access="remote" returntype="string" returnFormat="json"> 
        <cfset arguments = deserializeJSON(getHttpRequestData().content)>       
        <cftry>
        	<cfquery name="general_definitions_upd" datasource="#dsn#" result="query_result">	
                UPDATE
                    PROTEIN_SITES
                SET
                    DOMAIN = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.DOMAIN#">,
                    STATUS = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.STATUS#">,
                    MAINTENANCE_MODE = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.MAINTENANCE_MODE#">,
                    PRIMARY_DATA = <cfqueryparam cfsqltype="cf_sql_varchar" value="#Replace(SerializeJSON(arguments.PRIMARY_DATA[1]),'//','')#">,
                    UPDATE_DATE = <cfqueryparam value="#now()#" cfsqltype="cf_sql_date">,	
                    UPDATE_EMP = <cfqueryparam value="#session.ep.userid#" cfsqltype="cf_sql_integer">,
                    UPDATE_IP = <cfqueryparam value="#cgi.remote_addr#" cfsqltype="cf_sql_varchar">
                WHERE
                    SITE_ID =  <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.id#">    
            </cfquery>
            <cfset result.status = true>
            <cfset result.identitycol = #arguments.id#>
            <cfcatch type="any">
                <cfset result.status = false>
                <cfset result.error = cfcatch.message >
            </cfcatch>
        </cftry>
        <cfreturn Replace(SerializeJSON(result),'//','')>
	</cffunction>

    <cffunction name="lang_and_money_upd" access="remote" returntype="string" returnFormat="json"> 
        <cfset arguments = deserializeJSON(getHttpRequestData().content)>       
        <cftry>
        	<cfquery name="update_site_step_two" datasource="#dsn#" result="query_result">	
                UPDATE
                    PROTEIN_SITES
                SET
                    COMPANY = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.COMPANY#">,
                    ZONE_DATA = <cfqueryparam cfsqltype="cf_sql_varchar" value="#Replace(SerializeJSON(arguments.ZONE_DATA[1]),'//','')#">,
                    UPDATE_DATE = <cfqueryparam value="#now()#" cfsqltype="cf_sql_date">,	
                    UPDATE_EMP = <cfqueryparam value="#session.ep.userid#" cfsqltype="cf_sql_integer">,
                    UPDATE_IP = <cfqueryparam value="#cgi.remote_addr#" cfsqltype="cf_sql_varchar">
                WHERE
                    SITE_ID =  <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.id#">    
            </cfquery>
            <cfset result.status = true>
            <cfset result.identitycol = #arguments.id#>
            <cfcatch type="any">
                <cfset result.status = false>
                <cfset result.error = cfcatch.message >
            </cfcatch>
        </cftry>
        <cfreturn Replace(SerializeJSON(result),'//','')>
	</cffunction>

    <cffunction name="access_upd" access="remote" returntype="string" returnFormat="json"> 
        <cfset arguments = deserializeJSON(getHttpRequestData().content)>       
        <cftry>
        	<cfquery name="update_site_step_three" datasource="#dsn#" result="query_result">	
                UPDATE
                    PROTEIN_SITES
                SET
                    ACCESS_DATA = <cfqueryparam cfsqltype="cf_sql_varchar" value="#Replace(SerializeJSON(arguments.ACCESS_DATA[1]),'//','')#">,
                    UPDATE_DATE = <cfqueryparam value="#now()#" cfsqltype="cf_sql_date">,	
                    UPDATE_EMP = <cfqueryparam value="#session.ep.userid#" cfsqltype="cf_sql_integer">,
                    UPDATE_IP = <cfqueryparam value="#cgi.remote_addr#" cfsqltype="cf_sql_varchar">
                WHERE
                    SITE_ID =  <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.id#">    
            </cfquery>
            <cfset result.status = true>
            <cfset result.identitycol = #arguments.id#>
            <cfcatch type="any">
                <cfset result.status = false>
                <cfset result.error = cfcatch.message >
            </cfcatch>
        </cftry>
        <cfreturn Replace(SerializeJSON(result),'//','')>
	</cffunction>

    <cffunction name="theme_upd" access="remote" returntype="string" returnFormat="json"> 
        <cfset arguments = deserializeJSON(getHttpRequestData().content)>       
        <cftry>
        	<cfquery name="update_site_step_four" datasource="#dsn#" result="query_result">	
                UPDATE
                    PROTEIN_SITES
                SET
                    THEME_DATA = <cfqueryparam cfsqltype="cf_sql_varchar" value="#Replace(SerializeJSON(arguments.THEME_DATA[1]),'//','')#">,
                    UPDATE_DATE = <cfqueryparam value="#now()#" cfsqltype="cf_sql_date">,	
                    UPDATE_EMP = <cfqueryparam value="#session.ep.userid#" cfsqltype="cf_sql_integer">,
                    UPDATE_IP = <cfqueryparam value="#cgi.remote_addr#" cfsqltype="cf_sql_varchar">
                WHERE
                    SITE_ID =  <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.id#">    
            </cfquery>
            <cfset result.status = true>
            <cfset result.identitycol = #arguments.id#>
            <cfcatch type="any">
                <cfset result.status = false>
                <cfset result.error = cfcatch.message >
            </cfcatch>
        </cftry>
        <cfreturn Replace(SerializeJSON(result),'//','')>
	</cffunction>

    <cffunction name="add_template" access="remote" returntype="string" returnFormat="json"> 
        <cfset arguments = deserializeJSON(getHttpRequestData().content)>
        <cftry>
        	<cfquery name="insert_template" datasource="#dsn#" result="query_result">	
                INSERT INTO
                    PROTEIN_TEMPLATES  (SITE,STATUS,TYPE,TITLE,DESIGN_DATA,RECORD_DATE,RECORD_EMP,RECORD_IP)
                VALUES
                	(
                        <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.SITE#">,
                        <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.STATUS#">,
                        <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.TYPE#">,
                        <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.TITLE#">,
                        <cfqueryparam cfsqltype="cf_sql_varchar" value="#Replace(SerializeJSON(arguments.DESIGN_DATA[1]),'//','')#">,
                        <cfqueryparam value="#now()#" cfsqltype="cf_sql_date">,	
                        <cfqueryparam value="#session.ep.userid#" cfsqltype="cf_sql_integer">,
                        <cfqueryparam value="#cgi.remote_addr#" cfsqltype="cf_sql_varchar">
                    )
            </cfquery>
            <cfset result.status = true>
            <cfset result.identitycol = #query_result.identitycol#>          
            <cfcatch type="any">
                <cfset result.status = false>
                <cfset result.error = cfcatch.message >
            </cfcatch>
        </cftry>
        <cfreturn Replace(SerializeJSON(result),'//','')>       
	</cffunction>

    <cffunction name="upd_template" access="remote" returntype="string" returnFormat="json"> 
        <cfset arguments = deserializeJSON(getHttpRequestData().content)>       
        <cftry>
        	<cfquery name="upd_template" datasource="#dsn#" result="query_result">	
                UPDATE
                    PROTEIN_TEMPLATES
                SET
                    SITE = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.SITE#">,
                    STATUS = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.STATUS#">,
                    TYPE = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.TYPE#">,
                    TITLE = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.TITLE#">,
                    DESIGN_DATA =<cfqueryparam cfsqltype="cf_sql_varchar" value="#Replace(SerializeJSON(arguments.DESIGN_DATA[1]),'//','')#">,
                    UPDATE_DATE = <cfqueryparam value="#now()#" cfsqltype="cf_sql_date">,	
                    UPDATE_EMP = <cfqueryparam value="#session.ep.userid#" cfsqltype="cf_sql_integer">,
                    UPDATE_IP = <cfqueryparam value="#cgi.remote_addr#" cfsqltype="cf_sql_varchar">
                WHERE
                    TEMPLATE_ID =  <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.id#">    
            </cfquery>
            <cfset result.status = true>
            <cfset result.identitycol = #arguments.id#>
            <cfcatch type="any">
                <cfset result.status = false>
                <cfset result.error = cfcatch.message >
            </cfcatch>
        </cftry>
        <cfreturn Replace(SerializeJSON(result),'//','')>
	</cffunction>

    <cffunction name="add_page" access="remote" returntype="string" returnFormat="json"> 
        <cfset arguments = deserializeJSON(getHttpRequestData().content)>
        <cftry>
        	<cfquery name="insert_page" datasource="#dsn#" result="query_result">	
                INSERT INTO
                    PROTEIN_PAGES  (TITLE,FRIENDLY_URL,SITE,TEMPLATE_BODY,TEMPLATE_INSIDE,STATUS,PAGE_DATA,RECORD_DATE,RECORD_EMP,RECORD_IP)
                VALUES
                	(
                        <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.TITLE#">,
                        <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.FRIENDLY_URL#">,
                        <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.SITE#">,
                        <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.TEMPLATE_BODY#">,
                        <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.TEMPLATE_INSIDE#">,
                        <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.STATUS#">,
                        <cfqueryparam cfsqltype="cf_sql_varchar" value="#Replace(SerializeJSON(arguments.PAGE_DATA[1]),'//','')#">,
                        <cfqueryparam value="#now()#" cfsqltype="cf_sql_date">,	
                        <cfqueryparam value="#session.ep.userid#" cfsqltype="cf_sql_integer">,
                        <cfqueryparam value="#cgi.remote_addr#" cfsqltype="cf_sql_varchar">
                    )
            </cfquery>
            <cfset result.status = true>
            <cfset result.identitycol = #query_result.identitycol#>
            <cfcatch type="any">
                <cfset result.status = false>
                <cfset result.error = cfcatch.message >
            </cfcatch>
        </cftry>
        <cfreturn Replace(SerializeJSON(result),'//','')>       
	</cffunction>

    <cffunction name="upd_page" access="remote" returntype="string" returnFormat="json"> 
        <cfset arguments = deserializeJSON(getHttpRequestData().content)>
        <cftry>
        	<cfquery name="upd_page" datasource="#dsn#" result="query_result">	
                UPDATE
                    PROTEIN_PAGES
                SET
                    TITLE = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.TITLE#">,
                    FRIENDLY_URL = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.FRIENDLY_URL#">,
                    SITE = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.SITE#">,
                    TEMPLATE_BODY =  <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.TEMPLATE_BODY#">,
                    TEMPLATE_INSIDE = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.TEMPLATE_INSIDE#">,
                    STATUS = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.STATUS#">,
                    PAGE_DATA = <cfqueryparam cfsqltype="cf_sql_varchar" value="#Replace(SerializeJSON(arguments.PAGE_DATA[1]),'//','')#">,
                    UPDATE_DATE = <cfqueryparam value="#now()#" cfsqltype="cf_sql_date">,	
                    UPDATE_EMP = <cfqueryparam value="#session.ep.userid#" cfsqltype="cf_sql_integer">,
                    UPDATE_IP = <cfqueryparam value="#cgi.remote_addr#" cfsqltype="cf_sql_varchar">
                WHERE
                    PAGE_ID =  <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.id#">    
            </cfquery>
            <cfset result.status = true>
            <cfset result.identitycol = #arguments.id#>
            <cfcatch type="any">
                <cfset result.status = false>
                <cfset result.error = cfcatch.message >
            </cfcatch>
        </cftry>
        <cfreturn Replace(SerializeJSON(result),'//','')>
	</cffunction>

    <cffunction name="add_widget" access="remote" returntype="string" returnFormat="json"> 
        <cfset arguments = deserializeJSON(getHttpRequestData().content)>
        <cftry>
        	<cfquery name="insert_widget" datasource="#dsn#" result="query_result">	
                INSERT INTO
                    PROTEIN_WIDGETS  (SITE,TITLE,WIDGET_NAME,STATUS,WIDGET_DATA,RECORD_DATE,RECORD_EMP,RECORD_IP)
                VALUES
                	(
                        <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.SITE#">,
                        <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.TITLE#">,
                        <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.WIDGET_NAME#">,                        
                        <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.STATUS#">,
                        <cfif isDefined("arguments.WIDGET_DATA") and len(arguments.WIDGET_DATA)>
                            <cfqueryparam cfsqltype="cf_sql_varchar" value="#Replace(SerializeJSON(arguments.WIDGET_DATA),'//','')#">,
                        <cfelse>
                            null,
                        </cfif>
                        <cfqueryparam value="#now()#" cfsqltype="cf_sql_date">,	
                        <cfqueryparam value="#session.ep.userid#" cfsqltype="cf_sql_integer">,
                        <cfqueryparam value="#cgi.remote_addr#" cfsqltype="cf_sql_varchar">
                    )
            </cfquery>
            <cfset result.status = true>
            <cfset result.identitycol = #query_result.identitycol#>
            <cfcatch type="any">
                <cfset result.status = false>
                <cfset result.error = cfcatch.message >
            </cfcatch>
        </cftry>
        <cfreturn Replace(SerializeJSON(result),'//','')>       
	</cffunction>

    <cffunction name="upd_widget" access="remote" returntype="string" returnFormat="json"> 
        <cfset arguments = deserializeJSON(getHttpRequestData().content)>
        <cftry>
        	<cfquery name="upd_widget" datasource="#dsn#" result="query_result">	
                UPDATE
                    PROTEIN_WIDGETS
                SET
                    SITE = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.SITE#">,
                    TITLE = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.TITLE#">,
                    WIDGET_NAME = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.WIDGET_NAME#">,                        
                    STATUS = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.STATUS#">,
                    WIDGET_DATA = <cfqueryparam cfsqltype="cf_sql_varchar" value="#Replace(SerializeJSON(arguments.WIDGET_DATA),'//','')#">,
                    UPDATE_DATE = <cfqueryparam value="#now()#" cfsqltype="cf_sql_date">,	
                    UPDATE_EMP = <cfqueryparam value="#session.ep.userid#" cfsqltype="cf_sql_integer">,
                    UPDATE_IP = <cfqueryparam value="#cgi.remote_addr#" cfsqltype="cf_sql_varchar">
                WHERE
                    WIDGET_ID =  <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.id#">    
            </cfquery>
            <cfset result.status = true>
            <cfset result.identitycol = #arguments.id#>
            <cfcatch type="any">
                <cfset result.status = false>
                <cfset result.error = cfcatch.message >
            </cfcatch>
        </cftry>
        <cfreturn Replace(SerializeJSON(result),'//','')>
	</cffunction>

    <cffunction name="del_widget" access="remote" returntype="string" returnFormat="json"> 
        <cfset arguments = deserializeJSON(getHttpRequestData().content)>
        <cftry>
        	<cfquery name="del_widget" datasource="#dsn#" result="query_result">	
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
        <cfreturn Replace(SerializeJSON(result),'//','')>
	</cffunction>

    <cffunction name="add_menu" access="remote" returntype="string" returnFormat="json"> 
        <cfset arguments = deserializeJSON(getHttpRequestData().content)>
        <cftry>
        	<cfquery name="insert_menu" datasource="#dsn#" result="query_result">	
                INSERT INTO
                    PROTEIN_MENUS  (SITE,MENU_NAME,MENU_STATUS,IS_DEFAULT,MENU_DATA,RECORD_DATE,RECORD_EMP,RECORD_IP)
                VALUES
                	(
                        <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.SITE#">,
                        <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.MENU_NAME#">,
                        <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.MENU_STATUS#">,
                        <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.IS_DEFAULT#">,
                        <cfif isDefined("arguments.MENU_DATA") and len(arguments.MENU_DATA)>
                            <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.MENU_DATA#">,
                        <cfelse>
                            null,
                        </cfif>
                        <cfqueryparam value="#now()#" cfsqltype="cf_sql_date">,	
                        <cfqueryparam value="#session.ep.userid#" cfsqltype="cf_sql_integer">,
                        <cfqueryparam value="#cgi.remote_addr#" cfsqltype="cf_sql_varchar">
                    )
            </cfquery>
            <cfset result.status = true>
            <cfset result.identitycol = #query_result.identitycol#>
            <cfcatch type="any">
                <cfset result.status = false>
                <cfset result.error = cfcatch.message >
            </cfcatch>
        </cftry>
        <cfreturn Replace(SerializeJSON(result),'//','')>       
	</cffunction>

    <cffunction name="upd_menu" access="remote" returntype="string" returnFormat="json"> 
        <cfset arguments = deserializeJSON(getHttpRequestData().content)>
        <cftry>
        	<cfquery name="upd_menu" datasource="#dsn#" result="query_result">	
                UPDATE
                    PROTEIN_MENUS
                SET
                    SITE = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.SITE#">,
                    MENU_NAME = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.MENU_NAME#">,
                    MENU_STATUS  = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.MENU_STATUS#">,
                    IS_DEFAULT = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.IS_DEFAULT#">,
                    MENU_DATA = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.MENU_DATA#">,
                    UPDATE_DATE = <cfqueryparam value="#now()#" cfsqltype="cf_sql_date">,	
                    UPDATE_EMP = <cfqueryparam value="#session.ep.userid#" cfsqltype="cf_sql_integer">,
                    UPDATE_IP = <cfqueryparam value="#cgi.remote_addr#" cfsqltype="cf_sql_varchar">
                WHERE
                    MENU_ID =  <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.id#">    
            </cfquery>
            <cfset result.status = true>
            <cfset result.identitycol = #arguments.id#>
            <cfcatch type="any">
                <cfset result.status = false>
                <cfset result.error = cfcatch.message >
            </cfcatch>
        </cftry>
        <cfreturn Replace(SerializeJSON(result),'//','')>
	</cffunction>

    <cffunction name="del_site" access="remote" returntype="string" returnFormat="json">
        <cftry>
            <cfquery name="del_site" datasource="#dsn#"> 
                DELETE FROM PROTEIN_SITES WHERE SITE_ID =  <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.site#">
                DELETE FROM PROTEIN_TEMPLATES WHERE SITE =  <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.site#">
                DELETE FROM PROTEIN_PAGES WHERE SITE =  <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.site#">
                DELETE FROM PROTEIN_WIDGETS WHERE SITE =  <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.site#">
                DELETE FROM PROTEIN_MENUS WHERE SITE =  <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.site#">
            </cfquery>
            <cfset result.status = true>
            <cfcatch type="any">
                <cfset result.status = false>
                <cfset result.error = cfcatch.message >
            </cfcatch>  
        </cftry>
        <cfreturn Replace(SerializeJSON(result),'//','')>
    </cffunction>

    <cffunction name="del_template" access="remote" returntype="string" returnFormat="json">
        <cftry>
            <cfquery name="del_template" datasource="#dsn#"> 
                DELETE FROM PROTEIN_TEMPLATES WHERE TEMPLATE_ID =  <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.template#">
            </cfquery>
            <cfset result.status = true>
            <cfcatch type="any">
                <cfset result.status = false>
                <cfset result.error = cfcatch.message >
            </cfcatch>  
        </cftry>
        <cfreturn Replace(SerializeJSON(result),'//','')>
    </cffunction>

    <cffunction name="del_page" access="remote" returntype="string" returnFormat="json">
        <cftry>
            <cfquery name="del_page" datasource="#dsn#"> 
                DELETE FROM PROTEIN_PAGES WHERE PAGE_ID =  <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.page#">
            </cfquery>
            <cfset result.status = true>
            <cfcatch type="any">
                <cfset result.status = false>
                <cfset result.error = cfcatch.message >
            </cfcatch>  
        </cftry>
        <cfreturn Replace(SerializeJSON(result),'//','')>
    </cffunction>

    <cffunction name="del_menu" access="remote" returntype="string" returnFormat="json">
        <cftry>
            <cfquery name="del_menu" datasource="#dsn#"> 
                DELETE FROM PROTEIN_MENUS WHERE MENU_ID =  <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.menu#">
            </cfquery>
            <cfset result.status = true>
            <cfcatch type="any">
                <cfset result.status = false>
                <cfset result.error = cfcatch.message >
            </cfcatch>  
        </cftry>
        <cfreturn Replace(SerializeJSON(result),'//','')>
    </cffunction>
    
</cfcomponent>