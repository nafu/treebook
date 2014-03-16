class UserFriendshipDecorator < Draper::Decorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       source.created_at.strftime("%a %m/%d/%y")
  #     end
  #

  def friendship_state
    model.state.titleize
  end

  def sub_message
    case model.state
    when 'pending'
      "Friend request pending."
    when 'accepted'
      "You are friends with #{model.friend.first_name}."
    end
  end

end
