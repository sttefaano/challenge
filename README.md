# Ruby on Rails API

This API project is built on the basis of the proposed challenge.

## Requirements:

- Ruby 3.2.2
- Rails 7.0.8
- Redis 7.2.4

## Configuration:

1. Clone the repository

`git clone https://github.com/tu-usuario/tu-proyecto.git`

2. Install the gems:

`cd challenge`
`bundle install`

3. Set up the database:

`rails db:setup`

4. Start the Rails server:

`rails server`

5. Start Redis in a new terminal:
    
`redis-server`

6. Start Sidekiq in a new terminal:

`bundle exec sidekiq`

## Usage:

1. Create a new user (if successfully it will return a bearer token):

`curl -X POST -d "user[username]=new_user&user[password]=Password123&user[password_confirmation]=Password123" http://localhost:3000/users`

2. Login (if you don't have a bearer token yet)

`curl -X POST -d "user[username]=new_user&user[password]=Password123" http://localhost:3000/login`

3. And now use the token given to authenticate to other endpoints. Create a product:

`curl -X POST -d "product[name]=ProductName" -H "Authorization: Bearer {token_here}" http://localhost:3000/api/products`

4. Get all products

`curl -H "Authorization: Bearer {token_here}" http://localhost:3000/api/products`
