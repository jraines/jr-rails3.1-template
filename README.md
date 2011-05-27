
##This is a template for a Rails 3.1 app

To use, run this command:

````
rails new my-app-name -T -m jr-template.rb --skip-bundle
````

The -T option skips generation of Test::Unit files, because the template
sets up rspec.  The --skip-bundle command is ideal because the template
will run that prior to finishing the app setup.

###What does it do?

- Use rspec for testing, skip generation of view specs
- Use Factory Girl instead of fixtures
- Set up Cucumber to use Capybara
- Use Simple Form
- Generate Haml by default
- Replace your application.html.erb with a Haml version produced by the
  Nifty Generators gem
- Create a 'home' controller and set the root route to 'home#index'
- Delete default index.html
- Require the Coffeebeans gem, allowing you to write inline coffeescript
  with coffee_script_tag
- Require Capistrano and run ````capify```` to generate config
- Initialize a git repo and add the app's files to it, then commit them
- Make you a sandwich

###Potential future additions

- Auth setup
- Bundler config and integration with capistrano

