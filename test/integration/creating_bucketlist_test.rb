require 'test_helper'

class CreatingBucketlistTest < ActionDispatch::IntegrationTest
  ￼test "creates bucketlists" do
    post "/bucketlists" ,
￼￼￼ {bucketlist:
      {name: 'Things to do before 50'}
￼￼￼￼}.to_json,
    { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }

    assert_equal 201, response.status 

￼￼  bucketlist = json(response.body)
  
    assert_equal bucketlist_url(bucketlist[:id]), response.location
  end
end