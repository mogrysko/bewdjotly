$(function(){
  $('.like form').on('ajax:success', function(){
    var $btn = $(this).find('.btn')
    $btn.toggleClass('btn-default').toggleClass('btn-success');
    $btn.val($btn.hasClass('btn-default') ? 'Unlike' : 'Like');
  });
});
