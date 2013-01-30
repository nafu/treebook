require 'test_helper'

class StatusTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "that a status requires content" do
  	status = Status.new
  	assert !status.save
  	assert !status.errors[:content].empty?
  end

  test "that a status's requires content in at least 2 letters" do
  	status = Status.new
  	status.content = "h"
  	assert !status.save
  	assert !status.errors[:content].empty?
  end

  test "that a status has a user id" do
  	status = Status.new
  	status.content = "Hello"

  	assert !status.save
  	assert !status.errors[:user_id].empty?
  end
end
