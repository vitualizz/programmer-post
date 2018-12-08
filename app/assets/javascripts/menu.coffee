$(document).on 'turbolinks:load', ->
  activeMenu()
  activeOptionsMenu()

activeMenu = ->
  $('#sideMenu').click ->
    $('#sidebar').toggleClass('active')
    $('#content').toggleClass('active')
    $('#active-option').toggleClass('active')
    if $('#side-option-drop').hasClass('fa-angle-double-left')
      $('#side-option-drop').removeClass 'fa-angle-double-left'
      $('#side-option-drop').addClass 'fa-angle-double-right'
    else
      $('#side-option-drop').removeClass 'fa-angle-double-right'
      $('#side-option-drop').addClass 'fa-angle-double-left'

activeOptionsMenu = ->
  $('.option-menu').click ->
    $('.option-menu').removeClass('active')
    $(this).addClass('active')
