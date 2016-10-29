/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function(){
   $('#comboMedicos').on('change', function(){
       $.ajax({
           type: 'GET',
           url: 'ComboFecha',
           data: 'numCole='+$('#comboMedicos').val(),
           statusCode: {
               404: function() {
                   console.log('Pagina no encontrada');
               },
               500: function(){
                   console.log('Error en servidor');
               }
           },
           success: function(dados){
               pegadados = dados.split(":");
               limparselect();
               if(dados == '')
                   $('#idFecha').append('<option>---------------------</option>');
               else{
                   $('#idFecha').append('<option>---------------------</option>');

                   for(var i = 0; i < pegadados.length - 1; i++){
                       var fecha = pegadados[i]; 
                       //var nomeprovincia = pegadados[i].split("-")[1];
                       $('#idFecha').append('<option value ="'+fecha+'">'+fecha+'</option>');

                   }
               }
           }
       }) 
       
       function limparselect(){
           $('#idFecha option').remove();
       }
   }); 
   
   $('#idFecha').on('change', function(){
      $.ajax({
          type: 'GET',
          url: 'ComboHora',
          data: 'fecha='+$('#idFecha').val() + "qq" + $('#comboMedicos').val(),
          statusCode: {
              404: function() {
                  console.log('Pagina no encontrada de hora');
              },
              500: function(){
                  console.log('Error en servidor de hora');
              }
          },
          success: function(dados){
              pegadados = dados.split("-");
             
              limparselect();
              if(dados == '')
                  $('#idHora').append('<option>-------------------</option>');
              else{
                  $('#idHora').append('<option>-------------------</option>');
                  for(var i = 0; i < pegadados.length - 1; i++){
                      var hora = pegadados[i]; 
                      //var nomeprovincia = pegadados[i].split("-")[1];
                      $('#idHora').append('<option value ="'+hora+'">'+hora+'</option>');

                  }
              }
          }
      }) 
      function limparselect(){
          $('#idHora option').remove();
      }
  });


   
});