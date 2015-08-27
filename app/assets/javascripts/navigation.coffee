jQuery ->
  $('#twitter_login_button').click (event)->
    $(this).children('i.spinner').addClass('fa fa-spinner fa-pulse')
    return
