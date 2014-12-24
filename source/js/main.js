var APP;
APP = function(){
  var $menu = $('#menu'),
      $menulink = $('.menu-link');

  $menulink.click(function() {
    $menulink.toggleClass('active');
    $menu.toggleClass('active');
    return false;
  })
}

// $(document).on('page:load', APP); // add for rails turbopages
$(document).ready(APP);