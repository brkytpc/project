


component{

    

public function queryFilterFunction(){
    
  var queryString = "SELECT * FROM KAYIT_EVRAK WHERE (GONDERICI LIKE '%#form.keyword#%' OR ALICI LIKE '%#form.keyword#%' OR TESLIM_EDEN LIKE '%#form.keyword#%' OR TESLIM_ALAN LIKE '%#form.keyword#%' OR ACIKLAMA LIKE '%#form.keyword#%') "


   
    if(form.gonderiTipi != 4){
       queryString &= " AND (GONDERI_TIPI = #form.gonderiTipi#)"
    }

       if(form.durumAdi != 4){
        queryString &= " AND (DURUM = #form.durumAdi#)"
    }

    if(form.baslangic != ""){
        queryString &= " AND (TESLIM_TARIHI >= '#form.baslangic#')"
    }
    if(form.bitis != ""){
        queryString &= " AND (TESLIM_TARIHI <= '#form.bitis#')"
    }
    var number =(url.page -1) * 10;
    queryString &=  " ORDER BY ID OFFSET " 
    queryString &=   toString(number)  
    queryString &= " ROWS FETCH NEXT 10 ROWS ONLY"

    filterData = QueryExecute(queryString, [], {datasource = 'workCubeDSN'}); 

   

}




}

