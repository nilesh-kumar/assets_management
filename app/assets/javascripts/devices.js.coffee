# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(window).load ->
  $("#device_faulty").click ->
    $("#ref_faulty_date").toggle @checked
  $("#device_returned").click ->
    $("#ref_returned_date").toggle @checked
  
 