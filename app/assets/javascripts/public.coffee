scroll_to = (selector) ->
  $('html,body').animate { scrollTop: $(selector).offset().top }, 800
  false




sliding_elements_listener = ->

#----- TOP MENU SHOW --------
  ypos = window.pageYOffset
  if ypos > $('#header').height() - 100
    $('#top_menu').fadeIn()
  else
    $('#top_menu').fadeOut()

  #----- ABOUT ME TEXT SHOW -----------

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

  #----- PROJECTS TEXT AND BANNER SHOW -----------

  if ypos > $('#projects').position().top - 100 and ypos < $('#contact').position().top
    $('#about_projects').addClass 'second_effect_show'
    setTimeout (->
      $('#projects_banner').addClass 'show'
    ), 800
  else
    $('#about_projects').removeClass 'second_effect_show'
    $('#projects_banner').removeClass 'show'

  #-----CONTACT TEXT SHOW -----------

  if ypos > $('#contact').position().top - 100 
    $('#contact_text').addClass 'is-showing'
    setTimeout (->
      $('#contact_form').addClass 'is-showing'
    ), 800
  else
    $('#contact_text').removeClass 'is-showing'
    $('#contact_form').removeClass 'is-showing'

  return

 #----- SHOW TOP MENU ADDED TO LISTENER -----------
window.addEventListener 'scroll', sliding_elements_listener

# -------- HEADER MENU BOUNCING ----------

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

# ------BANNER FOR PROJECTS-------

  $('#next').click ->
    $("#projects_banner li.active").removeClass().next().add("#projects_banner li:first").last().addClass("active")
  $('#prev').click ->
    $("#projects_banner li.active").removeClass().prev().add("#projects_banner li:last").first().addClass("active")
  return

