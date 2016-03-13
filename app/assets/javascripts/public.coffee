

scroll_to = (selector) ->
  $('html,body').animate { scrollTop: $(selector).offset().top }, 800
  false



sliding_elements_listener = ->
  $('#loading_icon').remove()
  
#----- TOP MENU SHOW --------
  ypos = window.pageYOffset
  if ypos > $('#header').height() - 100
    $('#top_menu').fadeIn()
  else
    $('#top_menu').fadeOut()

  #----- ABOUT ME TEXT SHOW -----------
  if ypos > $('#about').position().top - 100 and ypos < $('#projects').position().top 

    $('#menu_about_me').addClass 'hovered' # top menu add selected view
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
    $('#menu_about_me').removeClass 'hovered'
  #   $('#whatido').removeClass 'is-showing'
  #   $('#me').removeClass 'is-showing'
  #   $('#technologies').removeClass 'is-showing'

  #----- PROJECTS TEXT AND BANNER SHOW -----------

  if ypos > $('#projects').position().top - 100 and ypos < $('#contact').position().top
    $('#menu_projects').addClass 'hovered'
    $('#about_projects').addClass 'is-showing'
    setTimeout (->
      $('#projects_banner').addClass 'is-showing'
    ), 800
  else
    $('#menu_projects').removeClass 'hovered'
  #   $('#about_projects').removeClass 'is-showing'
  #   $('#projects_banner').removeClass 'is-showing'

  #-----CONTACT TEXT SHOW -----------

  if ypos > ($('#contact').position().top - 100)
    $('#menu_contact').addClass 'hovered'
    $('#contact_text').addClass 'is-showing'
    setTimeout (->
      $('#contact_form_container').addClass 'is-showing'
    ), 800
    setTimeout (->
      $('#contact_forms').addClass 'is-showing'
    ), 1800
  else
    $('#menu_contact').removeClass 'hovered'
    # $('#contact_text').removeClass 'is-showing'
    # $('#contact_forms').removeClass 'is-showing'
    # $('#contact_form_container').removeClass 'is-showing'

  return

 #----- SHOW TOP MENU ADDED TO LISTENER -----------
 
window.addEventListener 'scroll', sliding_elements_listener
  

# -------- HEADER MENU BOUNCING ----------

$(window).on "load", ->
  $('#loading_icon').remove()
  $('#notice').hide()
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
    $('nav .circle').each (i) ->
      setTimeout (->
        $('nav .circle').eq(i).addClass 'is-showing'
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

