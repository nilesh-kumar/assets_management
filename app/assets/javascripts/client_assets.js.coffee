# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(window).load ->
  if $("#client_asset_referenceable_type").val() is "Device"
    $("#reference_Device").show()
    $("#reference_Computer").hide() 
    $("#reference_Asset").hide() 
  else if $("#client_asset_referenceable_type").val() is "Asset"
    $("#reference_Asset").show() 
    $("#reference_Devices").hide()
    $("#reference_Computer").hide()
  else
    $("#reference_Computer").show()
    $("#reference_Asset").hide()
    $("#reference_Devices").hide()
  $("#client_asset_referenceable_type").change ->
    if $("#client_asset_referenceable_type").val() is "Device"
      $("#reference_Device").show()
      $("#reference_Computer").hide()
      $("#reference_Asset").hide() 
    else if $("#client_asset_referenceable_type").val() is "Asset"
      $("#reference_Asset").show()
      $("#reference_Computer").hide()
      $("#reference_Device").hide() 
    else
      $("#reference_Computer").show()
      $("#reference_Asset").hide()
      $("#reference_Device").hide()
