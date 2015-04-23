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
      update: function(event, ui) {
        var ingredient_id, position;
        ingredient_id = ui.item.data('ingredient-id'); // grabs the ingredient id
        position = ui.item.index();
        // console.log("ingredient id : " + ingredient_id);
        // console.log("position: " + position);
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
    listState = 'enabled';
  } else {
    $('.list.sortable').sortable('disable');
    listState = 'disabled';
  }
  console.log("list reorder state: " + listState);
}