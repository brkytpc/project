
<cfinclude template="queries.cfm">

<html lang="en">
    <head>
      <meta charset="UTF-8"/>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />     
      
      <title>Parametre</title>
  
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

 <body class="py-4">
  


<section class="pricing py-5">
    <div class="container">
      <div class="row">      
        <div class="col-lg-6">         
            <div class="card-body border rounded">             
                



                <cfform name="statusForm" id="statusForm" method="post" action="parameterControl.cfm" onsubmit="add_status_parameter();">
                        <div class="col-md-6  mb-4  ">
                            <label>Gonderi durumu id Ekle</label>
                            <cfinput type="text" name="statusId" id="statusId" placeholder="id yaziniz" >
                        </div>
                        <div class="col-md-6  mb-4  ">
                    <label>Gonderi Durumu Ekle</label>
                    <cfinput type="text" name="statusName" id="statusName" placeholder="Gonderi Durumu Yaziniz" >
                </div>

                    <div class="col-md-4 mb-3"> 
                        <button type="submit" name="submit" class="btn btn-md btn-primary text-uppercase">Ekle</button>
                      
                      </div>  
                </cfform>
                    



                                          
          </div>
        </div>
        
        <div class="col-lg-6">       
            <div class="card-body border rounded">           
                <cfform name="cargoForm" id="cargoForm" method="post" action="parameterControl.cfm" onsubmit="add_cargo_parameter();">
                    <div class="col-md-6  mb-4  ">
                        <label>Kargo tipi id Ekle</label>
                        <cfinput type="text" name="cargoId" id="cargoId" placeholder="id yaziniz" >
                    </div>
                    <div class="col-md-6  mb-4  ">
                <label>Kargo Tipi Ekle</label>
                <cfinput type="text" name="cargoName" id="cargoName" placeholder="Kargo Tipi Yaziniz" >
            </div>

                <div class="col-md-4 mb-3"> 
                    <button type="submit" name="submit" class="btn btn-md btn-primary text-uppercase">Ekle</button>
                  
                  </div>  
            </cfform>
                   
                         
              
            
          </div>
        </div>        
      </div>
    </div>
  </section>


<!--- liste --->


<section class="pricing py-5">
    <div class="container">
      <div class="row">      
        <div class="col-lg-6">         
            <div class="card-body">             
    
                    <table class="table table-bordered" id="ParameterTable" >
                        <thead>
                          <tr>
                            <th scope="col">ID</th>
                            <th scope="col">Gonderi Durumu</th>   
                            <th scope="col">Guncelle</th>
                            <th scope="col">Sil</th>                                
                          </tr>
                        </thead>
                        <cfloop query="statusData">
                        <tbody>
                          <tr>
                            <th scope="row"><cfoutput>#statusData.STATUS_ID#</cfoutput></th>
                            <td><cfoutput>#statusData.STATUS_NAME#</cfoutput></td>
                            <cfform name="updateForm" id="updateForm" action="updateStatusParam.cfm?id=#statusData.STATUS_ID#">
                                <td><button type="submit" name="submit" class="btn btn-md btn-primary"><i class="fas fa-pencil-alt"></i></button></td>
                              </cfform>
                              
                                <cfform name="deleteStatusForm" id="deleteStatusForm" action="parameterControl.cfm" onsubmit="delete_status_parameter(#statusData.STATUS_ID#);">
                               <td><button type="submit" name="submit" class="btn btn-md btn-primary"><i class="fas fa-eraser"></i></button></td>
                               
                            </cfform>
                            
                            
                          </tbody>
                        </cfloop>
                    </table>            
          </div>
        </div>
        
        <div class="col-lg-6">       
            <div class="card-body">           
    
                    <table class="table table-bordered" id="ParameterTable" >
                        <thead>
                          <tr>
                            <th scope="col">ID</th>
                            <th scope="col">Kargo Tipi</th>
                            <th scope="col">Guncelle</th>
                            <th scope="col">Sil</th> 
                                   
                          </tr>
                        </thead>
                        <cfloop query="cargoTypeData">
                        <tbody>
                          <tr>
                            <th scope="row"><cfoutput>#cargoTypeData.CARGO_ID#</cfoutput></th>
                            <td><cfoutput>#cargoTypeData.CARGO_NAME#</cfoutput></td>
                            <cfform name="updateCargoForm" id="updateCargoForm" action="updateCargoParam.cfm?id=#cargoTypeData.CARGO_ID#">
                                <td><button type="submit" name="submit" class="btn btn-md btn-primary"><i class="fas fa-pencil-alt"></i></button></td>
                              </cfform>
                              
                                <cfform name="deleteCargoForm" id="deleteCargoForm" action="parameterControl.cfm" onsubmit="delete_cargo_parameter(#cargoTypeData.CARGO_ID#);">
                               <td><button type="submit" name="submit" class="btn btn-md btn-primary"><i class="fas fa-eraser"></i></button></td>
                               
                            </cfform>
                            
                          </tbody>
                        </cfloop>
                    </table>
                         
              
            
          </div>
        </div>        
      </div>
    </div>
  </section>









</body>

</html>