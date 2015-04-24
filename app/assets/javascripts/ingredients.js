var listState = 'disabled';
$(function() {
  listState = 'disabled'; // initialize listState to always be disabled
  listSortConfig();
  $('.reorder').click(toggleListSortable);
});

function listSortConfig() {
  $('.list.sortable').sortable({
      axis: 'y',
      items: '.ingredient',
      cursor: 'move',
      sort: function(event, ui) {
        return ui.item.addClass('');
      },
      update: function(event, ui) {
        var ingredient_id, position;
        ingredient_id = ui.item.data('ingredient-id'); // grabs the ingredient id
        position = ui.item.index();
        return $.ajax({
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

function toggleListSortable() {
  if (listState == 'disabled') {
    $('.list.sortable').sortable('enable');
    addButtonsToList();
    listState = 'enabled';
  } else {
    $('.list.sortable').sortable('disable');
    removeButtonsFromList();
    listState = 'disabled';
  }
  // remove before final commit
  console.log("list reorder state: " + listState);
}

function addButtonsToList() {
  $('h4 span i').addClass('fa fa-sort');
}

function removeButtonsFromList() {
  $('h4 span i').removeClass('fa fa-sort');
}