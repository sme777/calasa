$(document).ready(function() {
    $('.antihover').hover(function() {
        
        $(this).addClass('inverse');
        $(this).removeClass('btn-danger');
         
    }, function() {
        $(this).removeClass('inverse');
        $(this).addClass('btn-danger'); 
        });
  });