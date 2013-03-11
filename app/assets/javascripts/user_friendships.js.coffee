# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery () ->
  $('#add-friendship').click (event) ->
    event.preventDefault()
    addFriendshipBtn = $(this)

    $.ajax
      url: Routes.user_friendships_path({user_friendship: { friend_id: addFriendshipBtn.data('friendId') }})
      dataType: 'json'
      type: 'POST'
      error: (e) ->
        addFriendshipBtn.hide();
        $('#friend-status').html "<a href='#' class='btn btn-danger'>Error</a>"
      success: (e) ->
        addFriendshipBtn.hide();
        $('#friend-status').html "<a href='#' class='btn btn-success'>Friendship Requested</a>"