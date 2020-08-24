import $ from 'jquery';

function updateStatus(e){
  const taskId = event.currentTarget.id
  const status = event.currentTarget.checked
  $.ajax({
    type: "PUT",
    beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
    url: `/tasks/${taskId}`,
    data: {task:{id:taskId, status:status}},
  });
}

$(document).ready(function() {
  $(':checkbox').on(
    'click',
    function() {
      updateStatus();
    }
  );
});