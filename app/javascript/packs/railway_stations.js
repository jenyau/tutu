$(document).ready(function(){
  $(".edit").click(function(e){
    e.preventDefault();
    var station_id;
    var form;
    var title;

    station_id = $(this).data('stationId');
    console.log(station_id);

    form = $('#edit_railway_station_' + station_id);
    title = $(".railway_station_title_" + station_id);

    if(!$(this).hasClass('cancel')){

      $(this).html('Отмена');
      $(this).addClass('cancel');
    } else {

      $(this).html('Редактировать')
      $(this).removeClass('cancel');
    }
    form.toggle();
    title.toggle();

  })
})