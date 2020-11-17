<cfinclude template = "functions.cfc">
<cfinclude template = "queries.cfm">

<cfquery datasource="workCubeDSN" name="updateData">        
  SELECT * FROM KAYIT_EVRAK
LEFT JOIN CARGO_TYPE
ON KAYIT_EVRAK.GONDERI_TIPI=CARGO_TYPE.CARGO_ID
LEFT JOIN CARGO_STATUS
ON KAYIT_EVRAK.DURUM=CARGO_STATUS.STATUS_ID
WHERE ID = #url.id#      

    </cfquery>


<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8"/>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-9" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Jekyll v4.1.1">
    
    
    <title>Guncelle</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/4.5/examples/grid/">

    <!-- Bootstrap core CSS -->
    <link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
    .renk{
      background-color: blue;
    
      
    
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>
    <!-- Custom styles for this template -->
    <link href="grid.css" rel="stylesheet">
    <link href="css/styles.css" rel="stylesheet" />

<script type="text/javascript" src="control.js"></script>
<script src="jquery-1.10.2.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>





<cfscript>
    myString='#updateData.TESLIM_ZAMAN#';
    deliveryTime=mid(myString,12,5);
</cfscript>


  </head>

  <header>
    <nav class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top" id="mainNav">
        <div class="container">
            <a class="navbar-brand">KAYIT GUNCELLE</a>
            
            
        </div>
    </nav>


  </header><br><br><br><br><br>


  <body class="py-4">
    <div class="container"> 
 <cfform name="myForm" id="myForm" method="post" action="list.cfm" onsubmit="return updateData(#updateData.ID#);" required>

    
 
<div class="form-row">
      <div class="col-md-3 mb-3">
        <label>Gönderici</label><br>  
        <cfinput type="text" name="gonderici" id="gonderici" value="#updateData.GONDERICI#" >
        
      </div>

      <div class="col-md-3 mb-3">
        <label >Teslim eden</label>
        <cfinput type="text" name="teslimEden" id="teslimEden" value="#updateData.TESLIM_EDEN#"  >
      
      </div>

      <div class="col-md-3 mb-3">
        <label >Teslim tarihi</label><br>
        <cfinput type="date" name="teslimTarihi" id="teslimTarihi" value="#updateData.TESLIM_TARIHI#" >

      </div>

      <div class="col-md-3 mb-3">
        <label>Teslim saati</label><br>
        <cfinput type="time" name="teslimZamanı" id="teslimZamani" value="#deliveryTime#" >
       
      </div>           
    </div>  


    <div class="form-row">
      <div class="col-md-3 mb-3">
        <label>Alıcı</label><br>  
        <cfinput type="text" name="alici" id="alici" value="#updateData.ALICI#" >        
      </div>  

      <div class="col-md-3 mb-3">
        <label>Teslim Alan</label><br>  
        <cfinput type="text" name="teslimAlan" id="teslimAlan" value="#updateData.TESLIM_ALAN#"  >        
      </div>  


      <div class="col-md-3 mb-3">
        <label>Açıklama</label>        
        <textarea name="aciklama" id="aciklama" cols="46" rows="4" maxlength="60" ><cfoutput>#updateData.ACIKLAMA#</cfoutput></textarea><br /><br />        
      </div>
</div>

<div class="form-row">
  <div class="col-md-3 mb-3">
      <label>Gönderi Tipi</label>
      <cfselect class="custom-select mr-sm-2" name="gonderiTipi" id="gonderiTipi" query="cargoTypeData" value="CARGO_ID" display="CARGO_NAME" queryposition="below" selected="#updateData.CARGO_ID#" >
       
        <option value="">Lutfen gonderi tipi seciniz...</option>    
        
      </cfselect>  
      </div>
            


      <div class="col-md-3 mb-3">
      <label >Durum</label>
      <cfselect class="custom-select mr-sm-2" id="durumAdi" name="durumAdi" query="statusData" value="STATUS_ID" display="STATUS_NAME" queryposition="below" selected="#updateData.STATUS_ID#" >
        
        <option value="">Lutfen durum tipi seciniz...</option>
        
      </cfselect>
    </div>


    <cfinput type="hidden" name="user_id" value="#updateData.ID#">



    
    <button class="btn btn-primary col-md-4 mb-3" type="submit" >Guncelle</button>
    
    
    
    



  </cfform>


</div> 



</body>

