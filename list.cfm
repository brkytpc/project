<cfinclude template = "functions.cfc">
<cfinclude template="queries.cfm">    
    
    <!doctype html>
    <html lang="en">
      <head>
        <meta charset="UTF-8"/>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-9" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
        <meta name="generator" content="Jekyll v4.1.1">
        
        
        <title>Kayıt Listesi</title>
    
        <link rel="canonical" href="https://getbootstrap.com/docs/4.5/examples/grid/">
    
        <!-- Bootstrap core CSS -->
    <link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">
    
          <!-- Custom styles for this template -->
        
        <link href="css/styles.css" rel="stylesheet" />
        <script type="text/javascript" src="control.js"></script>
        <script src="jquery-1.10.2.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://kit.fontawesome.com/a076d05399.js"></script>


       
    
      </head>    


<header>
    <nav class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top" id="mainNav">
        <div class="container">
            <a class="navbar-brand">KAYIT LISTESI</a>
            
            
        </div>
    </nav>  
  </header><br><br><br><br><br>



  <cfform id="searchform" method="post" action="sonuc.cfm?page=1">

<div class="filter">
  <div class="container py-5 border rounded">
    <h3>Filtrele</h3>
    <div class="form-row">      
      <div class="col-md-3 mb-3  ">
        <label>Anahtar Kelime</label>
        <cfinput type="text" name="keyword" id="keyword" placeholder="Anahtar Kelime Giriniz..." >        
          </div>        

              <div class="col-md-3 mb-3">
                <label>Gönderi Tipi</label>
                <cfselect class="custom-select mr-sm-2" name="gonderiTipi" id="gonderiTipi" query="cargoTypeData" value="CARGO_ID" display="CARGO_NAME" queryposition="below">  
                <option value="4">Lutfen gonderi tipi seciniz...</option>    
                
                </cfselect>        
                  </div> 

                  <div class="col-md-3 mb-3">
                    <label>Gönderi Durumu</label>
                    <cfselect class="custom-select mr-sm-2" id="durumAdi" name="durumAdı" query="statusData" value="STATUS_ID" display="STATUS_NAME" queryposition="below">
                      <option value="4">Lutfen durum tipi seciniz...</option>
                      
                    </cfselect>       
                      </div> 


     
    </div><br>  
    <div class="form-row">  

      <div class="col-md-3 mb-3">
        <label>Başlangıç Tarihi</label>
    <input type="date" id="baslangic" name="baslangic" >  
  </div>     

  <div class="col-md-2 mb-3"> 
    <label>Bitiş Tarihi</label>    
          <input type="date" id="bitis" name="bitis">
        </div> 

        <div class="col-md-4 mb-3"> 
          <button type="submit" name="submit" class="btn btn-lg btn-primary text-uppercase">Ara..</button>
          
          </div>
    </div>
     
  </div>
</div>
</cfform><br>


    
    <body class="py-5">    
        <div class="container">
          <h3>Kayıt Listesi</h3>
            <a href="add.cfm" class="btn btn-sm btn-primary text-uppercase" style="float:right;">Kayıt Ekle</a><br><br>
            <a href="parameterControl.cfm" class="btn btn-sm btn-primary text-uppercase" style="float:right;">Parametre Listesi</a><br><br>      
            
            
            
        

        

        <table class="table table-bordered" id="myTable" >
            <thead>
              <tr>
                <th scope="col">#</th>
                <th scope="col">GONDERICI</th>
                <th scope="col">ALICI</th>
                <th scope="col">TESLIM EDEN</th>
                <th scope="col">TESLIM ALAN</th>
                <th scope="col">TESLIM ZAMANI</th>
                <th scope="col">GONDERI TIPI</th>
                <th scope="col">DURUM</th>
                <th scope="col">ACIKLAMA</th>
                <th scope="col">TESLIM TARIHI</th>                
                <th scope="col">GUNCELLE</th>
                <th scope="col">SIL</th>
              </tr>
            </thead>
            <cfloop query="listData">
            <tbody id="myTables">
              <tr>
                <th scope="row"><cfoutput>#listData.ID#</cfoutput></th>
                <td><cfoutput>#listData.GONDERICI#</cfoutput></td>
                <td><cfoutput>#listData.ALICI#</cfoutput></td>
                <td><cfoutput>#listData.TESLIM_EDEN#</cfoutput></td>
                <td><cfoutput>#listData.TESLIM_ALAN#</cfoutput></td>
                
                <td><cfscript>
                  myString="#listData.TESLIM_ZAMAN#";
                  WriteOutput(mid(myString,11,6));
           </cfscript></td>

                <td><cfoutput>#listData.CARGO_NAME#</cfoutput></td>

                <td><cfscript>listStatusFunction()</cfscript></td>
                

                <td><cfoutput>#listData.ACIKLAMA#</cfoutput></td>
                <td><cfoutput>#listData.TESLIM_TARIHI#</cfoutput></td> 

                <cfform name="updateForm" id="updateForm" action="update.cfm?id=#listData.ID#">
                  <td><button type="submit" name="submit" class="btn btn-md btn-primary"><i class="fas fa-pencil-alt"></i></button></td>
                </cfform>
                
                  <cfform name="deleteForm" id="deleteForm" action="list.cfm" onsubmit="return deleteData(#listData.ID#);">
                 <td><button type="submit" name="submit" class="btn btn-md btn-primary"><i class="fas fa-eraser"></i></button></td>
                 
              </cfform>
                
                
                
              </tr>
    
            </cfloop>
             
            </tbody>
          </table>
        </div>



        
      
    
    </body>