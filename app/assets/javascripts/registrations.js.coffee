# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


ready = ->
  #$('.sign-up-submit').click (event) ->
    #event.preventDefault()
    #$(this).parent('form').submit()

  $('.back_link').click (event) ->
    $('.first-step').show()
    $('.second-step').addClass('hide')

  $('.user-type').click (event) ->
    $.ajax(
      type: "GET"
      url: "/registrations/user_details"
      data:
        user_type: $(this).data('value')
    ).done (msg) ->
      $('.third-step').html(msg.html)
      $('.second-step').addClass('hide')

  $("#new_user").validate
    rules:
      email:
        required: true
        email: true
      password:
        required: true
        minlength: 8
      agree: "required"
    messages:
      password:
        required: "Please provide a password"
        minlength: "Your password must be at least 8 characters long"

      email:
        required: "Please enter email"
        email: "Please enter a valid email address"
      agree: "Please accept our policy"

    submitHandler: (form) ->
      $('.first-step').hide()
      $('.second-step').removeClass('hide')
      return

$(document).ready(ready)
$(document).on('page:load', ready)