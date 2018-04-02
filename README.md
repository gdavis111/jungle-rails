# Jungle

A mini e-commerce application built with Rails 4.2.  Users are able to register and sign in which gives them the ability to review and rate individual products.  Users have the option to delete only their own comments/reviews.  The app keeps track of average review ratings and lists that with each product on the site when scrolling through the list.  The app has built-in Stripe functionality to purchase items that have been added in the cart.  There is an `admin` section of the website which requires a preset username and password to access, where admin can add or delete products as well as add categories to the app.


## Setup

1. Fork & Clone
2. Run `bundle install` to install dependencies
3. Create `config/database.yml` by copying `config/database.example.yml`
4. Create `config/secrets.yml` by copying `config/secrets.example.yml`
5. Run `bin/rake db:reset` to create, load and seed db
6. Create .env file based on .env.example
7. Sign up for a Stripe account
8. Put Stripe (test) keys into appropriate .env vars
9. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Ruby
* Rails
* PostgreSQL
* Stripe
* sass-rails
* uglifier
* jquery-rails
* turbolinks
* jbuilder
* sdoc
* bcrypt
* puma
* bootstrap-sass
* font-awesome-rails
* money-rails
* carrierwave
* rmagick
* faker
* byebug
* quiet_assets
* dotenv-rails
* web-console
* spring
* newrelic_rpm
* rails_12factor