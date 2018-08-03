# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

document.addEventListener 'DOMContentLoaded', () ->
  taskListItems = document.querySelector('.tasks.list').querySelectorAll('.task.list_item');
  taskListItems.forEach (taskElement) -> taskElement.addEventListener 'dblclick', () ->
    if !taskElement.classList.contains 'editing'
      location.href = '?editing_task=' + taskElement.dataset.id
