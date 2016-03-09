scroll_to = (selector) ->
  $('html,body').animate { scrollTop: $(selector).offset().top }, 800
  false




show_menu = ->
  ypos = window.pageYOffset
  if ypos > $('#header').height() - 100
    $('#top_menu').fadeIn()
  else
    $('#top_menu').fadeOut()
  if ypos > $('#about').position().top - 100 and ypos < $('#projects').position().top 
    $('#about_me').addClass 'hovered'
    $('#me').addClass 'is-showing'
    setTimeout (->
      $('#whatido').addClass 'is-showing'
      return
    ), 500
    setTimeout (->
      $('#technologies').addClass 'is-showing'
      return
    ), 1500
  else
    $('#whatido').removeClass 'is-showing'
    $('#me').removeClass 'is-showing'
    $('#technologies').removeClass 'is-showing'

  if ypos > $('#projects').position().top - 100 and ypos < $('#contact').position().top
    $('#about_projects').addClass 'second_effect_show'
    setTimeout (->
      $('#projects_banner').addClass 'show'
    ), 800
  else
    $('#about_projects').removeClass 'second_effect_show'
    $('#projects_banner').removeClass 'show'
  return

window.addEventListener 'scroll', show_menu

$(document).ready ->
  $('body').bind 'mousewheel', ->
    false
  $('body').hide().fadeIn 1000
  setTimeout (->
    $('#logo .logo').each (i) ->
      setTimeout (->
        $('#logo .logo').eq(i).addClass 'is-showing'
        return
      ), 600 * (i + 1)
      return
    return
  ), 400
  setTimeout (->
    $('nav ul li').each (i) ->
      setTimeout (->
        $('nav ul li').eq(i).addClass 'is-showing'
        return
      ), 300 * (i + 1)
      return
    return
  ), 2500
  projects = ['#project1','#project2','#project3']

  $('#next').click ->
    $("#projects_banner li.active").removeClass().next().add("#projects_banner li:first").last().addClass("active")
  $('#prev').click ->
    $("#projects_banner li.active").removeClass().prev().add("#projects_banner li:last").first().addClass("active")
  return

