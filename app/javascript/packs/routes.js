$(document).ready(function(){
  $(".route_edit").click(function(e){
    e.preventDefault();
    var route_id;
    var form;
    var title;

    route_id = $(this).data('routeId');
    form = $("#route_edit_" + route_id);
    title = $(".route_title_" + route_id);

    if(!$(this).hasClass('cancel')){
      form.show();
      title.hide();

      $(this).html('Отмена');
      $(this).addClass('cancel');
    } else {
      form.hide();
      title.show();

      $(this).html('Редактировать');
      $(this).removeClass('cancel');
    }
  })
})