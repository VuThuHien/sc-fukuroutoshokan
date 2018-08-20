$(document).ready(function(){
  $('.flash-push').fadeOut(4000);

  $('.new-movies-slide').owlCarousel({
    startPosition: 0,
    loop: false,
    lazyLoad: true,
    items: 3,
    rewind: true,
    autoplay: true,
    stopOnHover: false,
    // autoplaySpeed: 100,
    margin: 30,
    nav: true,
    navSpeed: 500,
    slideSpeed: 200,
    paginationSpeed: 800,
    rewindSpeed: 1000,
    navText: ["<i class='fa fa-chevron-left'></i>","<i class='fa fa-chevron-right'></i>"],
    responsive: {
      0: {
        items: 1
      },
      480: {
        items: 2
      },
      768: {
        items: 3
      },
      1024: {
        items: 3
      },
      1300: {
        items: 3
      }
    }
  });
  
  
  
  // login
  $('.input100').each(function(){
    $(this).on('blur', function(){
      if($(this).val().trim() != "") {
        $(this).addClass('has-val');
      }
      else {
        $(this).removeClass('has-val');
      }
    })    
  })


  /*==================================================================
  [ Validate ]*/
  var input = $('.validate-input .input100');
  
  $('.validate-form').on('submit',function(){
      var check = true;
  
      for(var i=0; i<input.length; i++) {
          if(validate(input[i]) == false){
              showValidate(input[i]);
              check=false;
          }
      }
  
      return check;
  });
  
  
  $('.validate-form .input100').each(function(){
      $(this).focus(function(){
         hideValidate(this);
      });
  });
  
  function validate (input) {
      if($(input).attr('type') == 'email' || $(input).attr('name') == 'email') {
          if($(input).val().trim().match(/^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{1,5}|[0-9]{1,3})(\]?)$/) == null) {
              return false;
          }
      }
      else {
          if($(input).val().trim() == ''){
              return false;
          }
      }
  }
  
  function showValidate(input) {
      var thisAlert = $(input).parent();
  
      $(thisAlert).addClass('alert-validate');
  }
  
  function hideValidate(input) {
      var thisAlert = $(input).parent();
  
      $(thisAlert).removeClass('alert-validate');
  }
});
