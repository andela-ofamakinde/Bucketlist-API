 require 'test_helper'

class UpdatingBucketlistTest < ActionDispatch::IntegrationTest
  # setup do
  #   host! "localhost:3000/api/v1" 
  #   @bucketlist = Bucketlist.create!(name: 'Crazy & dangerous') 
  #     @user = User.create!(name: "toyosi", email: "toyosi@gmail.com", password: "olatoyosi",
  #                        password_confirmation: "olatoyosi", loggedin: true)
  # end

  # test " update bucketlists"  do
  # patch "/bucketlists/#{@bucketlist.id}" ,
  #   {name: 'Safe and silly'}.to_json ,
  #   { "Authorization" => "Token token=#{@user.auth_token}",
  #     "Accept" => Mime::JSON, "Content-Type" => Mime::JSON.to_s}

  #   assert_equal 200, response.status
  #   assert_equal 'Safe and silly', @bucketlist.reload.name
  # end

  # test " should not update empty bucketlists"  do
  # patch "/bucketlists/#{@bucketlist.id}" ,
  #   {name: ''}.to_json ,
  #   { "Authorization" => "Token token=#{@user.auth_token}",
  #     "Accept" => Mime::JSON, "Content-Type" => Mime::JSON.to_s }
      
  #   assert_equal 422, response.status
  # end

end