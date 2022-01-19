# Warehaus

Warehaus is a tracking application to help logistics companies manage products in their inventories.

With the current version of Warehaus, you can:
* Add new items to the inventory
* Edit existing items to update quantity in stock or product details
* Delete items from the inventory
* View a product page for each item
* View a table of all items; sortable by name, quantity, price, and weight
* Filter items based on product name, price, color tags, and / or whether item(s) are in or out of stock

This app was built for the Shopify Summer 2022 Backend Developer Internship Challenge submission.

The app is live on Heroku here: [Warehaus](https://pacific-temple-47932.herokuapp.com/)

To run the application locally, continue to follow the README below.

## Prerequisites

You can use [rbenv](https://github.com/rbenv/rbenv) to manage the app's Ruby environment.
* Install rbenv based on the [instructions](https://github.com/rbenv/rbenv#installation) for your operating system

Warehaus uses [PostgreSQL](https://www.postgresql.org/) as its database.
* Download and install PostgreSQL [here](https://www.postgresql.org/download/) by selecting your operating system and following the prompts

## Language + Framework Versions

Warehaus uses Rails 7.0.1, which requires Ruby 2.7.0+.
* Rails will be installed when you run the 'bundle install' command during Setup
* Note that Ruby 3.0.0 is the preferred version, though earlier versions after 2.7.0 should work if you update your Gemile and [.ruby-version file](https://github.com/rbenv/rbenv#choosing-the-ruby-version) to match your current version

You can use rbenv to install Ruby by running the following command in your terminal:
```
rbenv install 3.0.0
```
More information on installing Ruby versions with rbenv can be found [here](https://github.com/rbenv/rbenv#installing-ruby-versions).

You will need the [Bundler](https://bundler.io/) gem to manage dependencies. To install Bundler or update to the latest version, run the following command in your terminal:

```
gem install bundler
```

More information on installation and usage for Bundler can be found [here](https://github.com/rubygems/rubygems/tree/master/bundler#installation-and-usage).

## Setup + Usage

To run Warehaus locally, please complete the following steps.

1. Clone the project repository and navigate to the main project directory in your terminal.
```
git clone git@github.com:cariperi/warehaus.git
cd warehaus
```

2. Run this command in your terminal to install project gems:
```
bundle install
```
3. Ensure that Postgres is running, and run these commands to initialize the database, set up the database structure, and seed with sample data:
```
rails db:create
rails db:migrate
rails db:seed
```
4. Run this command to start the Rails server:
```
rails s
```
5. Navigate to [localhost:3000](http://localhost:3000/) in your browser - happy inventorying!

## Testing

To run tests for this app, type the following command in your terminal:
```
bundle exec rspec
```

## Roadmap
The current version of Warehaus provides basic inventory tracking functionality.

Future versions could include features such as:
* Adding and deleting tags from individual items
* Associating more than one type of tag with items (ex. material, supplier) in addition to color tags
* Exporting product data from customized filter views to a .csv or other format
* Implement browser-based tests with [cuprite](https://github.com/rubycdp/cuprite)
