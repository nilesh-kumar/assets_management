# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(window).load ->
  $("#client_asset_referenceable_type").change ->
    if $("#client_asset_referenceable_type").val() is "Asset"
      $("#ref_assets").show()
      $("#ref_computers").hide()
    else
      $("#ref_assets").hide()
      $("#ref_computers").show()