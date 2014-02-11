// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var availableTasksPage = 0;

function loadAvailableTasks(){
  availableTasksPage++;
  $("a#load_more_available_tasks_button").hide();
  $(".load_more_available_tasks .loader").show();
  $.get("/tasks?page=" + availableTasksPage, function(data) { 
    $("#available_tasks").append(data);
    if($("#available_tasks").data("count") <= $("#available_tasks .task").length)
      $("a#load_more_available_tasks_button").remove();
    $("a#load_more_available_tasks_button").show();
    $(".load_more_available_tasks .loader").hide();
  });
} 

$(function(){
  // tasks#show

  $(document).on('click', 'a.disabled', function(e){
    e.preventDefault();
  });


  // tasks#index

  loadAvailableTasks();

  $("a#load_more_available_tasks_button").click(function(){
    loadAvailableTasks();
    return false;
  });

  // tasks#new and tasks#edit
  $('#task_task_type_id').change(function(){
    var taskTypes = $("#task_points").data("task-types");
    for(var i = 0; i < taskTypes.length; i++){
      if(taskTypes[i]["id"] == $('#task_task_type_id').val()){
        $("#task_points").val(taskTypes[i]["points"]);
      }
    }
  });

});
