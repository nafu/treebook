require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  should have_many(:user_friendships)
  should have_many(:friends)

  test "a user should enter a first name" do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:first_name].empty?
  end


  test "a user should enter a last name" do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:last_name].empty?
  end


  test "a user should enter a profile name" do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  end


  test "a user should have a unique profile name" do
  	user = User.new
  	user.profile_name = users(:jason).profile_name
  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  end


  test "a user should have a profile name without spaces" do
    user = User.new(first_name: 'Jason', last_name: 'Seifer', email: 'jason2@teamtreehouse.com')
    user.password = user.password_confirmation = 'asdfasdf'

    user.profile_name = "My Profile with Spaces"

  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  	assert user.errors[:profile_name].include?("Must be formatted correctly.")
  end


  test "a user can have a correctly formatted profile name" do
    user = User.new(first_name: 'Jason', last_name: 'Seifer', email: 'jason2@teamtreehouse.com')
    user.password = user.password_confirmation = 'asdfasdf'

    user.profile_name = 'jasonseifer_1'
    assert user.valid?
  end

  test "that no error is raised when trying to access a friend list" do
    assert_nothing_raised do
      users(:jason).friends
    end
  end

  test "that creating friendships on a user works" do
    users(:jason).friends << users(:mike)
    users(:jason).friends.reload
    assert users(:jason).pending_friends.include?(users(:mike))
  end

  test "that creating a friendship based on user id and friend id works" do
    UserFriendship.create user_id: users(:jason).id, friend_id: users(:mike).id
    assert users(:jason).pending_friends.include?(users(:mike))
  end

  test "tha calling to_param on a user returns the_profile" do
    assert_equal "jasonseifer", users(:jason).to_param
  end
end
