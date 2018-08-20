$(document).ready(function(){
  $('.flash-push').fadeOut(4000);

  $('.new-movies-slide').owlCarousel({
    startPosition: 0,
    loop: false,
    lazyLoad: true,
    items: 3,
    rewind: true,
    autoplay: false,
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
});

$(document).on('click', '.notify', function(){
  var id = $(this).attr('id');
  var element = this;
  $.ajax({
    beforeSend: function (xhr) {
      xhr.setRequestHeader('X-CSRF-Token',
          $('meta[name="csrf-token"]').attr('content'));
    },
    type: 'PATCH',
    url: '/notifications/' + id,
    success: function(data){
      $(element).addClass('unread');
      $('.notification-counter').html(data.unread);
    }
  });
});
