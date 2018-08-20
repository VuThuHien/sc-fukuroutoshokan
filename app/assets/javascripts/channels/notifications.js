$(document).ready(function() {
  (function() {
  App.notifications = App.cable.subscriptions.create({
    channel: 'NotificationsChannel'
    },
    {
      connected: function() {},
      disconnected: function() {},
      received: function(data) {
        $('.notification-counter').html(data.counter);
        $('#list-notifications').prepend('<li class="list-group-item row notify"' + 'id=' + data.id +'>' + data.content + '</li>');
        $('.notification-popup').show();
        $('.notification-popup').html(data.content);
        // $('.notification-popup').fadeOut(20000);
        var timer;
				var fadeInBuffer = false;
				$(document).mousemove(function () {
					timer = setTimeout(function () {
					  console.log("fadeout");
            if(!$('.notification-popup').is(':hover')){
              $('.notification-popup').fadeOut();
            }
						$('html').css({
							cursor: 'pointer'
						});
						fadeInBuffer = true;
					}, 15000)
				});
      }
    });
  }).call(this);
});
