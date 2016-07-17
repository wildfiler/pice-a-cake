jQuery ->
  $('form').on 'click', '.remove_component', (event) ->
    $(this).prev('select[type=hidden]').val('1')
    $(this).closest('.component').hide()
    event.preventDefault()

  $('form').on 'click', '.add_component', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).before($(this).data('fields').replace(regexp, time))
    event.preventDefault()
