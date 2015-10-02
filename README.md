## Bucketlist API

This exercise is to create an API that delivers JSON data for a bucketlist service.

The project uses Token Based Authentication to secure the API endpoints

The Endpoints covered are
<table>
  <thead>
  <tr>
    <td>EndPoint</td>
    <td>Functionality</td>
    <td>Public Access</td>
  </tr>
  </thead>
  <tbody>
    <tr>
      <td>POST /signup</td>
      <td>Signs up a user</td>
      <td>TRUE</td>
    </tr>
    <tr>
      <td>POST /auth/login</td>
      <td>Logs a user in</td>
      <td>TRUE</td>
    </tr>
    <tr>
      <td>GET /auth/logout</td>
      <td>Logs a user out</td>
      <td>FALSE</td>
    </tr>
    <tr>
      <td>POST /bucketlists/</td>
      <td>Logs a user out</td>
      <td>FALSE</td>
    </tr>
      <tr>
      <td>GET /bucketlists/</td>
      <td>List all the created bucket lists</td>
      <td>TRUE</td>
    </tr>
    <tr>
      <td>GET /bucketlists/id</td>
      <td>Get single bucket list</td>
      <td>FALSE</td>
    </tr>
    <tr>
      <td>POST /bucketlists/id/td>
      <td>Add a new item to this bucket list</td>
      <td>FALSE</td>
    </tr>
    <tr>
      <td>PUT /bucketlists/<id></td>
      <td>Update this bucket list</td>
      <td>FALSE</td>
    </tr>
    <tr>
      <td>DELETE /bucketlists/<id></td>
      <td>Delete this single bucket list</td>
      <td>FALSE</td>
    </tr>
  </tbody>
</table>

#### Lets Begin

#### Versioning the API

In order for the API interface and the url to remain stable and consistent, we need to version our API.
This ensures that if there is change to the routing, the parameters passed to the API or response format, all of the clients using the old API dont break.
With versioning, new and improved APIs can be released, without cutting off clients using the old APIs.
We'll be versioning our api with routes like api/v1/bucketlists instead of just /bucketlists.
This is configured in the config/routes.rb file:

```
namespace :api do  
  namespace :v1 do  
    resources :users  
    post 'bucketlists/:bucketlist_id' => 'bucketlist_items#create'
    resources :bucketlists  
    post 'login' => 'login#create'
    get 'logout' => 'login#logout'
    get 'list' => 'bucketlist#lists'
  end  
end 
```
####Endpoints

1. POST /api/v1/signup

 This is the endpoint for a user to signup to use the application. The request for this is shown below
```
  post :create ,:name => "Olatoyosi", 
                :email=> "user@example.com",
                :password=> "password", 
                :password_confirmation=> "password"
```
The expected JSON response for a succesful request is 
```
{
    "user": {
        "id": 1,
        "name": "Olatoyosi",
        "email": "user@example.com",
        "auth_token": "82624aba607f40c358803cf9c29ad893",
        "created_at": "2015-09-23T11:17:21.673Z",
        "updated_at": "2015-10-01T17:20:50.324Z"
    }
}
```

2. Token Based Authentication

Token based authentication is when an API client uses a token identifier to make authenticated HTTP requests. A token is a random 32 digits number assigned to the user on signup and its verified when the user makes a request. A token expires after 2 days after which a new token is regenerated. To assign a token to a user: models/user.rb:
```
class User < ActiveRecord::Base
  before_save :generate_token
  ...
  def generate_token
    if self.expire_token == nil || self.expire_token <= DateTime.now
    begin
    self.auth_token = SecureRandom.hex
    end while self.class.exists?(auth_token: auth_token)
     self.expire_token = DateTime.now + 2
    end
 end
end
```
In the controllers/application.rb file:

```
  def authenticate_token
    authenticate_with_http_token do |token, options|
      @current_user = User.find_by(auth_token: token)
    end
  end
```
3. POST /auth/login

A signed up user is able to login to the app after providing a valid username and password. A logged in user uses his token as authenticate to make requests. The request format is shown below:

```
 post :create, {:email=> "toyosi@gmail.com",
                   :password=> "password"}
```
response for a succesful request is

```
{
    "token": "b21812afdd969d7cf22c59451de12345",
    "loggedin": true,
    "expire_token": "2015-10-04T11:32:03.465Z"
}
```

A request with a wrong email address or wrong password will generate a response with a 422 status 

```
{
    "error": "Incorrect credentials"
}
```

4. POST /bucketlists/

 A logged in user should be able to create a bucketlist with valid parameters. A post request is to create a bucketlist is shown below

```
  post :create ,:name => "Bucketlist1" 
```

After successful creation, the JSON data model for the bucketlist is shown below

```
{
  id: 1,
  name: “BucketList1”,
  date_created: “2015-08-12 11:57:23”,
  date_modified: “2015-08-12 11:57:23”,
  created_by: “1113456”
}
```

An invalid bucketlist name returns the following response

```
{
    "name": [
        "can't be blank",
        "is too short (minimum is 1 character)"
    ]
}
```

5. POST /bucketlists/:id

 A post request is to create a bucketlist: 

```
  post :create ,:name => "I need to do X" ,
                :bucketlist_id => 1,
                :user_id => 1113456
```

After succesful creation of an item, the JSON data model for the bucketlist is shown below

```
{
    bucketlist: 
     {
      id: 1,
      name: “BucketList1”,
      items: [
        {
                id: 1,
                name: “I need to do X”,
                date_created: “2015-08-12 11:57:23”,
                date_modified: “2015-08-12 11:57:23”,
                done: False
            }
        ],
    date_created: “2015-08-12 11:57:23”,
  date_modified: “2015-08-12 11:57:23”,
  created_by: “1113456”
    }
}
```

The response for an unsuccesful creation of a bucketlist item is the same for unsuccesful creation of a bucketlist.














