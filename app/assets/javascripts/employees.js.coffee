# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(window).load ->
  if $("#employee_association_associable_type").val() is "Item"
      $("#ref_Item").show()
      $("#ref_Device").hide()
      $("#ref_Computer").hide()
  else if $("#employee_association_associable_type").val() is "Device"
      $("#ref_Device").show()
      $("#ref_Computer").hide()
      $("#ref_Item").hide()
  else
      $("#ref_Item").hide()
      $("#ref_Device").hide()
      $("#ref_Computer").show()
  $("#employee_association_associable_type").change ->
   if $("#employee_association_associable_type").val() is "Item"
      $("#ref_Item").show()
      $("#ref_Device").hide()
      $("#ref_Computer").hide()
    else if $("#employee_association_associable_type").val() is "Device"
      $("#ref_Device").show()
      $("#ref_Item").hide()
      $("#ref_Computer").hide()
    else
      $("#ref_Device").hide()
      $("#ref_Item").hide()
      $("#ref_Computer").show()