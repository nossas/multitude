// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require turbolinks
//= require datetimepicker
//= require medium-editor
//= require modernizr
//= require meurio_ui
//= require_tree .

$(function(){
  var options = {};
  var instM = $('[data-remodal-id=modal]').remodal(options);
  instM.open();

  $(document).foundation();

  $('[data-datetimepicker]').datetimepicker({
    format:'d/m/Y H:i',
    lang: 'pt'
  });

  $(window.location.hash).foundation('reveal', 'open');

  $(".twitter-share-button").click(function(event){
    window.open(
      $(event.target).attr("href"),
      'twitter-share-dialog',
      'width=550,height=450'
    );
    return false;
  });

  $(".facebook-share-button").click(function(event){
    window.open(
      $(event.target).attr("href"),
      'facebox-share-dialog',
      'width=626,height=436'
    );
    return false;
  });

});
