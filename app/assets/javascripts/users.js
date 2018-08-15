//= require jquery/dist/jquery.min
//= require bootstrap/dist/js/bootstrap.min
//= require propellerkit/dist/js/propeller.min
//= require propellerkit/components/datetimepicker/js/bootstrap-datetimepicker

$(document).ready(function() {
  $('#datepicker-realease').datetimepicker({
    format: 'YYYY-MM-DD'
  });
  
  $(".dropdown").hover(            
        function() {
            $('.dropdown-menu', this).not('.in .dropdown-menu').stop(true,true).slideDown("400");
            $(this).toggleClass('open');        
        },
        function() {
            $('.dropdown-menu', this).not('.in .dropdown-menu').stop(true,true).slideUp("400");
            $(this).toggleClass('open');       
        }
    );
});
