<!--- liste sayfası için --->

<cffunction name="listStatusFunction">
    <cfscript>
    if('#listData.STATUS_ID#' == 0){      
     writeoutput('<h3 class="badge badge-success">#listData.STATUS_NAME#</h3>')
    }else if('#listData.STATUS_ID#' == 1){
      writeoutput('<h3 class="badge badge-danger">#listData.STATUS_NAME#</h3>')
      
    }else if('#listData.STATUS_ID#' == 2){  
      writeoutput('<h3 class="badge badge-info">#listData.STATUS_NAME#</h3>')
      
    }else{ 
      writeoutput('<h3 class="badge badge-warning">#listData.STATUS_NAME#</h3>')
    }
     
    
    </cfscript>
    
    </cffunction>       



<!-------------- filtre sayfası için-------------------->






<cffunction name="statusFunction">
  <cfscript>
  if('#filterData.DURUM#' == 0){  
    myText = '<h3 class="badge badge-success">Kabul Edildi</h3>'
  }else if('#filterData.DURUM#' == 1){
    
    myText = '<span class="badge badge-danger">Reddedildi</span>'
  }else if('#filterData.DURUM#' == 2){  
    myText = '<span class="badge badge-info">Alıcısına Teslim Edildi</span>'
  }else{ 
  myText = '<span class="badge badge-warning">Kayıp</span>'
  }
   return myText;
  
  </cfscript>
            
            </cffunction>
    
            <cffunction name="cargoFunction">
                <cfscript>
                  if('#filterData.GONDERI_TIPI#' == 0){  
                    myText = 'Dosya'
                  }else if('#filterData.GONDERI_TIPI#' == 1){
                    
                    myText = 'Kargo'
                  }else if('#filterData.GONDERI_TIPI#' == 2){  
                    myText = 'Mektup'
                  }else{ 
                  myText = 'Canlı Kargo'
                  }
                   return myText;
                  
                  </cfscript>
              
              
              </cffunction>