$(document).ready(function() {
  listSortConfig();
  // initialize listState to always be disabled upon visiting the page
  setInitialListStateAsDisabled();
  $('.reorder').click(toggleListSortable);
});

function listSortConfig() {
  $('.sortable').sortable({
      axis: 'y',
      items: '.ingredient',
      cursor: 'move',

      // this event is when an ingredient is selected and during the click and
      // hold action
      sort: function(event, ui) {
        ui.item.css('background-color','lightgray'); // set background during movement
      },

      // this event occurs when click has been released
      stop: function(event, ui) {
        ui.item.css('background-color','white'); // resetting background to default
        ui.item.effect('highlight', {}, 1000); // adds highlight effect when deactivate ingredient
      },

      update: function(event, ui) {
        var ingredient_id, position;
        ingredient_id = ui.item.data('ingredientId'); // grabs the ingredient id
        position = ui.item.index();
        $.ajax({
          type: 'POST',
          url: '/ingredients/update_row_order',
          dataType: 'json',
          data: {
            ingredient: {
              ingredient_id: ingredient_id,
              row_order_position: position
            }
          }
        });
      }
  });
}

function setInitialListStateAsDisabled() {
  $('.sortable').sortable('disable');
}

function toggleListSortable() {
  var listState = $('.sortable').sortable('instance').options.disabled;

  if (listState == true) {
    $('.sortable').sortable('enable');
  } else {
    $('.sortable').sortable('disable');
  }
  toggleIconsToList(listState);
}

function toggleIconsToList(listState) {
  if ( listState == false ) {
    $('span i').removeClass('fa fa-sort');
  } else {
    $('span i').addClass('fa fa-sort');
  }
}