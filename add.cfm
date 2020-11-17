<cfinclude template="queries.cfm">

<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Jekyll v4.1.1">
    
    
    <title>Ekle</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/4.5/examples/grid/">

    <!-- Bootstrap core CSS -->
<link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    
    <link href="css/styles.css" rel="stylesheet" />

<script type="text/javascript" src="control.js"></script>
<script src="jquery-1.10.2.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


  </head>

  <header>
    <nav class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top" id="mainNav">
        <div class="container">
            <a class="navbar-brand">KAYIT EKLE</a>            
        </div>
    </nav>
  </header><br><br><br><br><br>

   
   <body class="py-4">
    <div class="container"> 
        


 <cfform name="myForm" id="myForm" method="post" action="list.cfm" onsubmit="return addData();" required>
 
<div class="form-row">
      <div class="col-md-3 mb-3">
        <label>Gönderici</label><br>  
        <cfinput type="text" name="gonderici" id="gonderici" >
        
      </div>

      <div class="col-md-3 mb-3">
        <label >Teslim eden</label>
        <cfinput type="text" name="teslimEden" id="teslimEden"  >
      
      </div>

      <div class="col-md-3 mb-3">
        <label >Teslim tarihi</label><br>
        <cfinput type="date" name="teslimTarihi" id="teslimTarihi" >

      </div>

      <div class="col-md-3 mb-3">
        <label>Teslim saati</label><br>
        <cfinput type="time" name="teslimZamanı" id="teslimZamani" >
       
      </div>           
    </div>  


    <div class="form-row">
      <div class="col-md-3 mb-3">
        <label>Alıcı</label><br>  
        <cfinput type="text" name="alici" id="alici" >        
      </div>  

      <div class="col-md-3 mb-3">
        <label>Teslim Alan</label><br>  
        <cfinput type="text" name="teslimAlan" id="teslimAlan" >        
      </div>  


      <div class="col-md-3 mb-3">
        <label>Açıklama</label>        
        <textarea name="aciklama" id="aciklama" cols="46" rows="4" maxlength="60"></textarea><br /><br />        
      </div>
</div>

<div class="form-row">
  <div class="col-md-3 mb-3">
      <label>Gönderi Tipi</label>
      <cfselect class="custom-select mr-sm-2" name="gonderiTipi" id="gonderiTipi"  query="cargoTypeData" value="CARGO_ID" display="CARGO_NAME" queryposition="below">  
        <option value="">Lutfen gonderi tipi seciniz...</option>    
       
      </cfselect>  
      </div>
      


      <div class="col-md-3 mb-3">
      <label >Durum</label>
      <cfselect class="custom-select mr-sm-2" id="durumAdi" name="durumAdı"  query="statusData" value="STATUS_ID" display="STATUS_NAME" queryposition="below">
        <option value="">Lutfen durum tipi seciniz...</option>
       
      </cfselect>
    </div>


    <button class="btn btn-primary col-md-4 mb-3" type="submit">Ekle</button>
    


  </cfform>

</div> 






</body>

