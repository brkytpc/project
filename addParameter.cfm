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

<section class="pricing py-5">
    <div class="container">
      <div class="row">      
        <div class="col-lg-6">         
            <div class="card-body border rounded">             
                



                <cfform name="statusForm" id="statusForm" method="post" action="" onsubmit="">
                        <div class="col-md-6  mb-4  ">
                            <label>Gonderi durumu id Ekle</label>
                            <cfinput type="text" name="statusID" id="statusID" placeholder="id yaziniz" >
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
                <cfform name="cargoForm" id="cargoForm" method="post" action="" onsubmit="">
                    <div class="col-md-6  mb-4  ">
                        <label>Kargo tipi id Ekle</label>
                        <cfinput type="text" name="cargoID" id="cargoID" placeholder="id yaziniz" >
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