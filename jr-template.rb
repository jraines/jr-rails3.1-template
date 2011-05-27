gem 'haml-rails'
gem 'simple_form'
gem 'coffeebeans'
gem 'capistrano'

gem 'nifty-generators', :group => :development
gem 'rails3-generators', :group => :development

gem 'rspec-rails', :group => [ :development, :test ]
gem 'cucumber-rails', :group => [ :development, :test ]
gem 'factory_girl_rails', :group => [ :development, :test ]
gem 'database_cleaner', :group => [ :development, :test ]
gem 'capybara', :group => [ :development, :test ]

run 'bundle install'

generate 'nifty:layout --haml'
remove_file 'app/views/layouts/application.html.erb'

generate 'simple_form:install'
generate 'rspec:install'
generate 'cucumber:install', '--capybara'

inject_into_file 'spec/spec_helper.rb', "\nrequire 'factory_girl'", :after => "require 'rspec/rails'"

inject_into_file 'config/application.rb', :after => "config.assets.enabled = true" do
  <<-eos

    # Add lib & subdirs to autoload path
    config.autoload_paths += %W(\#{config.root}/lib)
    config.autoload_paths += Dir["\#{config.root}/lib/**/"]
    
    # Customize generators
    config.generators do |g|
      g.form_builder :simple_form
      g.template_engine :haml
      g.test_framework :rspec, :views => false, :fixture => true
      g.fixture_replacement :factory_girl, :dir => 'spec/factories'
    end
  eos
end

generate 'controller', 'home index'
route 'root :to => "home#index"'
remove_file 'public/index.html'

capify!

git :init
git :add => "."
git :commit => "-a -m 'create initial application'"

say <<-eos
  ============================================================================
  Your new Rails application is ready to go.
  
  Don't forget to scroll up for important messages from installed generators.
eos


