$(document).ready(function() {
  listSortConfig();
  // initialize listState to always be disabled upon visiting the page
  setInitialListStateAsDisabled();
  $('.reorder').click(toggleListSortable);
});

function listSortConfig() {
  $('.list.sortable').sortable({
      axis: 'y',
      items: '.ingredient',
      cursor: 'move',
      // this event is when an ingredient is selected and during the click and
      // hold action
      sort: function(event, ui) {
        ui.item.css('background-color','lightgray');
      },
      // this event occurs when click has been released
      stop: function(event, ui) {
        ui.item.css('background-color','white');
        ui.item.children('div').effect('highlight', {}, 1000);
      },
      update: function(event, ui) {
        var ingredient_id, position;
        ingredient_id = ui.item.data('ingredient-id'); // grabs the ingredient id
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
        })
      }
  });
}

function setInitialListStateAsDisabled() {
  $('.list.sortable').sortable('disable');
}

function toggleListSortable() {
  var listState = $('.list.sortable').sortable('instance').options.disabled;

  if (listState == true) {
    $('.list.sortable').sortable('enable');
  } else {
    $('.list.sortable').sortable('disable');
  }
  toggleIconsToList();
  // remove before final commit
  console.log("list reorder state: " + listState);
}

function toggleIconsToList() {
  var listState = $('.list.sortable').sortable('instance').options.disabled;

  if ( listState == true ) {
    $('h4 span i').removeClass('fa fa-sort');
  } else {
    $('h4 span i').addClass('fa fa-sort');
  }
}