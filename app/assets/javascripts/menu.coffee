$(document).on 'turbolinks:load', ->
  activeMenu()
  activeOptionsMenu()

activeMenu = ->
  $('#sidebarCollapse').click ->
    $('#sidebar').toggleClass('active')
    $('#content').toggleClass('active')

activeOptionsMenu = ->
  $('.option-menu').click ->
    $('.option-menu').removeClass('active')
    $(this).addClass('active')
