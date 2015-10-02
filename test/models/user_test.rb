require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "create user" do
    user = User.new(name: "Jibola", email: "jibola@gmail.com", password: "jibolaoa", password_confirmation: "jibolaoa")
    assert user.save
    refute_empty user.auth_token
  end

  test "should not create user with incomplete records" do
    user = User.new
    user1 = User.new( name: "Jibola", password: "jibolaoa", 
                      password_confirmation: "jibolaoa")
    user2 = User.new( name: "Jibola",  email: "jibola@gmail.com", 
                      password: "jibolaoa", password_confirmation: "jibolaoa")
    user3 = User.new( name: "Jibola", email: "jibola@gmail.com", 
                      password: "jibolaoa", password_confirmation: "jibolaoa")
    user4 = User.new( name: "Jibola", email: "jibola@gmail.com", 
                      password: "jibolaoa", password_confirmation: "jibolao")
    user5 = User.new( name: "Jibola", email: "jibolagmail.com", 
                      password: "jibolaoa", password_confirmation: "jibolao")
    user6 = User.new( name: "Jibola", email: "jibola002@gmail.com", 
                      password: "jibo", password_confirmation: "jibo")
    assert_not user.save
    assert_not user1.save
    assert user2.save
    assert_not user3.save
    assert_not user4.save
    assert_not user5.save
    assert_not user6.save
  end

end
