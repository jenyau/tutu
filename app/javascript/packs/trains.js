$(document).ready(function(){
  $(".train_edit").click(function(e){
    e.preventDefault();
    var train_id;
    var form;
    var title;

    train_id = $(this).data('trainId');
    form = $("#train_edit_" + train_id);
    title = $(".train_title_" + train_id);

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