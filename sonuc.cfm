<cfinclude template = "functions.cfc">
<cfinclude template = "queryFilter.cfc">


<cfparam name="form.keyword" default="#cookie.keyword#">
<cfparam name="form.baslangic" default="#cookie.baslangic#">
<cfparam name="form.bitis" default="#cookie.bitis#">
<cfparam name="form.gonderiTipi" default="#cookie.gonderiTipi#">
<cfparam name="form.durumAdi" default="#cookie.durumAdi#" >


<cfcookie name="keyword" 
    value = #form.keyword# >
    
  </cfcookie>
  <cfcookie name="baslangic"
    value = #form.baslangic# >
    
  </cfcookie>
  <cfcookie name="bitis"
    value = #form.bitis# >
    
  </cfcookie>
  <cfcookie name="gonderiTipi"
    value = #form.gonderiTipi# >
    
  </cfcookie>
  <cfcookie name="durumAdi"
    value = #form.durumAdi# >
    
  </cfcookie>
  

<cfscript>
  queryFilterFunction();
</cfscript>

<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-9" />
<link href="css/styles.css" rel="stylesheet" />
<script type="text/javascript" src="control.js"></script>
<script src="jquery-1.10.2.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>

</head>

<body class="py-5">    
    <div class="container">
      <a href="list.cfm" class="btn btn-sm btn-primary text-uppercase" style="float:right;">Liste Sayfasi</a><br>
      <h3>Kayit Listesi</h3><br>
      
<table class="table table-bordered" id="myTable"  >
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
    
    <cfloop query="filterData"> 

    <tbody id="myTables">
      <tr>
        <th scope="row"><cfoutput>#filterData.ID#</cfoutput></th>

        
        <td><cfoutput>#filterData.GONDERICI#</cfoutput></td>
        <td><cfoutput>#filterData.ALICI#</cfoutput></td>
        <td><cfoutput>#filterData.TESLIM_EDEN#</cfoutput></td>
        <td><cfoutput>#filterData.TESLIM_ALAN#</cfoutput></td>
        
        <td><cfscript>
          myString="#filterData.TESLIM_ZAMAN#";
          WriteOutput(mid(myString,11,6));
   </cfscript></td>

        <td><cfoutput>#cargoFunction()#</cfoutput></td>
        <td><cfoutput>#statusFunction()#</cfoutput></td> 
        <td><cfoutput>#filterData.ACIKLAMA#</cfoutput></td>
        <td><cfoutput>#filterData.TESLIM_TARIHI#</cfoutput></td>                
        <td><a href="update.cfm?id=<cfoutput>#filterData.ID#</cfoutput>"><i class="fas fa-pencil-alt"></i></td>
        <td><a href="delete.cfm?id=<cfoutput>#filterData.ID#</cfoutput>"><i class="fas fa-eraser"></i></a></td>
        
        
      </tr>

    </cfloop>
   
     
    </tbody>
    
  </table>

  <cfif filterData.RecordCount eq 0><cfoutput>Sonuç bulunamadı...</cfoutput>  </cfif>
  <nav aria-label="...">
    <ul class="pagination pagination-sm">
      <li class="page-item"><a class="page-link" href="?page=1">1</a></li>
      <li class="page-item"><a class="page-link" href="?page=2">2</a></li>
      <li class="page-item"><a class="page-link" href="?page=3">3</a></li>
    </ul>
  </nav>
</div>


        
      
    
</body>



