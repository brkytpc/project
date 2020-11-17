function addData() {
  

    var teslimTarihi = document.forms["myForm"]["teslimTarihi"].value.trim();
    var gonderici = document.forms["myForm"]["gonderici"].value.trim();
    var teslimEden = document.forms["myForm"]["teslimEden"].value.trim();
    var teslimAlan = document.forms["myForm"]["teslimAlan"].value.trim();
    var teslimZamani= document.forms["myForm"]["teslimZamani"].value.trim();
    var alici = document.forms["myForm"]["alici"].value.trim();
    var aciklama = document.forms["myForm"]["aciklama"].value.trim();
    var gonderiTipi = document.forms["myForm"]["gonderiTipi"].value.trim();
    var durumAdi = document.forms["myForm"]["durumAdi"].value.trim();
  
    if ((teslimTarihi == "")  || (gonderici == "") || (teslimEden == "") || (teslimAlan == "") || (teslimZamani == "")|| (alici == "") || (aciklama == "") || (gonderiTipi == "") ||(durumAdi == "")) {
      alert("Lutfen Zorunlu Alanları giriniz...");
      return false;        
  }  

  

    $.ajax({                
     url: 'queryMethods.cfc?method=add_query',
     type: "POST",
     data: $("#myForm").serialize(),
     success: function(){
       alert("Kayıt Başarılı...");
     },
     error: function(){
       alert("Kayıt Başarısız...");
     } 
     
     
   });
   
  return true;   
  
  }


  function deleteData(id){
    $.ajax({                
        url: 'queryMethods.cfc?method=delete_query&id=' + id,
        type: "POST",
        data: $("#deleteForm").serialize(),
        success: function(){
          alert("Başarıyla silindi...");
        },  
        error: function(){
          alert("Silme işlemi Başarısız...");
        } 
       
    }); 
    }


    function updateData(id){
      var teslimTarihi = document.forms["myForm"]["teslimTarihi"].value.trim();
      var gonderici = document.forms["myForm"]["gonderici"].value.trim();
      var teslimEden = document.forms["myForm"]["teslimEden"].value.trim();
      var teslimAlan = document.forms["myForm"]["teslimAlan"].value.trim();
      var teslimZamani= document.forms["myForm"]["teslimZamani"].value.trim();
      var alici = document.forms["myForm"]["alici"].value.trim();
      var aciklama = document.forms["myForm"]["aciklama"].value.trim();
      var gonderiTipi = document.forms["myForm"]["gonderiTipi"].value.trim();
      var durumAdi = document.forms["myForm"]["durumAdi"].value.trim();
    
      if ((teslimTarihi == "")  || (gonderici == "") || (teslimEden == "") || (teslimAlan == "") || (teslimZamani == "")|| (alici == "") || (aciklama == "") || (gonderiTipi == "") ||(durumAdi == "")) {
        alert("Lutfen Zorunlu Alanları giriniz...");
        return false;        
    }  
  
    
  
      $.ajax({                
       url: 'queryMethods.cfc?method=upd_query&id=' + id,
       type: "POST",
       data: $("#myForm").serialize(),
       success: function(){
         alert("Başarıyla güncellendi...");
       },
       error: function(){
         alert("Güncelleme Başarısız...");
       } 
       
       
     });
     
    return true;  
      }

      //PARAMETER FUNCTIONS
      function add_status_parameter(){

        var statusId = document.forms["statusForm"]["statusId"].value.trim();
        var statusName = document.forms["statusForm"]["statusName"].value.trim();
        
      
        if ((statusId == "")  || (statusName == "")) {
          alert("Lutfen Zorunlu Alanları giriniz...");
          return false;        
      } 




        $.ajax({                
            url: 'queryMethods.cfc?method=add_status_parameter' ,
            type: "POST",
            data: $("#statusForm").serialize(),
            success: function(){
              alert("Başarıyla eklendi...");
            },  
            error: function(){
              alert("Ekleme işlemi başarısız...");
            } 
           
        }); 
        }


        function delete_status_parameter(id){
          $.ajax({                
            url: 'queryMethods.cfc?method=delete_status_parameter&id=' + id  ,
            type: "POST",
            data: $("#deleteStatusForm").serialize(),
            success: function(){
              alert("Başarıyla silindi...");
            },  
            error: function(){
              alert("Silme işlemi başarısız...");
            } 
           
        }); 


        }



        function upd_status_parameter(id){

          var statusId = document.forms["statusForm"]["statusId"].value.trim();
          var statusName = document.forms["statusForm"]["statusName"].value.trim();
          
        
          if ((statusId == "")  || (statusName == "")) {
            alert("Lutfen Zorunlu Alanları giriniz...");
            return false;        
        } 
  
  
  
  
          $.ajax({                
              url: 'queryMethods.cfc?method=upd_status_parameter&id=' +id ,
              type: "POST",
              data: $("#statusForm").serialize(),
              success: function(){
                alert("Başarıyla güncellendi...");
              },  
              error: function(){
                alert("Güncelleme işlemi başarısız...");
              } 
             
          }); 
          }





          //Cargo Type Functions

          function add_cargo_parameter(){

            var cargoId = document.forms["cargoForm"]["cargoId"].value.trim();
            var cagroName = document.forms["cargoForm"]["cargoName"].value.trim();
            
          
            if ((cargoId == "")  || (cagroName == "")) {
              alert("Lutfen Zorunlu Alanları giriniz...");
              return false;        
          } 
    
    
    
    
            $.ajax({                
                url: 'queryMethods.cfc?method=add_cargo_parameter' ,
                type: "POST",
                data: $("#cargoForm").serialize(),
                success: function(){
                  alert("Başarıyla eklendi...");
                },  
                error: function(){
                  alert("Ekleme işlemi başarısız...");
                } 
               
            }); 
            }
    
    
            function delete_cargo_parameter(id){
              $.ajax({                
                url: 'queryMethods.cfc?method=delete_cargo_parameter&id=' + id  ,
                type: "POST",
                data: $("#deleteCargoForm").serialize(),
                success: function(){
                  alert("Başarıyla silindi...");
                },  
                error: function(){
                  alert("Silme işlemi başarısız...");
                } 
               
            }); 
    
    
            }
    
    
    
            function upd_cargo_parameter(id){
    
              var cargoId = document.forms["cargoForm"]["cargoId"].value.trim();
            var cagroName = document.forms["cargoForm"]["cargoName"].value.trim();
            
          
            if ((cargoId == "")  || (cagroName == "")) {
              alert("Lutfen Zorunlu Alanları giriniz...");
              return false;        
          } 
      
      
      
      
              $.ajax({                
                  url: 'queryMethods.cfc?method=upd_cargo_parameter&id=' +id ,
                  type: "POST",
                  data: $("#cargoForm").serialize(),
                  success: function(){
                    alert("Başarıyla güncellendi...");
                  },  
                  error: function(){
                    alert("Güncelleme işlemi başarısız...");
                  } 
                 
              }); 
              }


 
/*
  
  $.ajax({                
    url: '/cfc/components.cfc?method=add_record',
    type: "GET",
    data: $("#myForm").serialize(),
    success: function (returnData) {
        //returndata cfc response burdan json gelir ise önce parse edilir.
        var response = JSON.parse(returnData);
        if(response.status==true){
         /*response.status true dönmüş kayıt yapıldı,
          eğer ekleme sayfası ise response.identitycol ile ekenen kaydın id sini aldık cfc den 
          burdaki id ile kaydın upd sayfaına yönlendirme yapabiliriz.
          
          upd de bu işlemi yapıyorsa aynı sayfaya yönlendirebiliriz
         
        }else if(response.status==false){
          //response.status false dönmüş, false ise response.error u basacaz alert ile
       }
   },
   error: function () {
       // hata mesajı
   }
}); 
  */
  
  
  
  




