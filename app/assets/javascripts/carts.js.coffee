# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $('#personal-delivery').hide()
  $('#post-delivery').hide()
  $('#party-delivery').hide()
  showDelivery()  
  
@showDelivery = () ->  
  if !$('#delivery_personal').is(":checked")
    $('#personal-delivery').fadeOut()
  else
    $('#personal-delivery').fadeIn()
    
  if !$('#delivery_post').is(":checked")
    $('#post-delivery').fadeOut()
  else
    $('#post-delivery').fadeIn()
    
  if !$('#delivery_party').is(":checked")
    $('#party-delivery').fadeOut()   
  else
    $('#party-delivery').fadeIn()