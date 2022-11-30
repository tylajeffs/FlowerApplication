# A sample Guardfile
# More info at https://github.com/guard/guard#readme

## Uncomment and set this to only include directories you want to watch
# directories %w(app lib config test spec features) \
#  .select{|d| Dir.exist?(d) ? d : UI.warning("Directory #{d} does not exist")}

## Note: if you are using the `directories` clause above and you are not
## watching the project directory ('.'), then you will want to move
## the Guardfile to a watched dir and symlink it back, e.g.
#
#  $ mkdir config
#  $ mv Guardfile config/
#  $ ln -s config/Guardfile .
#
# and, you'll have to watch "config/Guardfile" instead of "Guardfile"

guard :minitest do
  # with Minitest::Unit
  watch(%r{^test/test_helper\.rb$})      { 'test' }

  # Run a test any time it changes
  watch(%r{^test/models/.+_test\.rb$}) #models
  watch(%r{^test/integration/.+_test\.rb$}) #integration

  # Run model tests
  watch(%r{^app/models/(.+)\.rb$}) do |m|
    "test/models/#{m[1]}_test.rb"
 end

  # Run integration test every time a corresponding controller changes
  watch(%r{^app/controllers/(.+)_controller\.rb$}) do |m|
     "test/integration/#{m[1]}_test.rb"
  end

  # Run integration test every time a corresponding view changes
  watch(%r{^app/views/(.+)/.+\.erb$}) do |m|
    "test/integration/#{m[1]}_test.rb"
  end

  # Run all integration test every time application controller changes
  watch(%r{^app/controllers/application_controller\.rb$}) do
    "test/integration"
  end

  # Run all integration test every time application layout changes
  watch(%r{^app/views/layouts/application\.html\.erb$}) do
    "test/integration"
  end

  # Run mailer tests when mailer views change
  watch(%r{^app/views/(.+)_mailer/.+}) do |m|
    "test/mailers/#{m[1]}_mailer_test.rb"
  end
end

Guard::Minitest::Runner.module_eval do
  def run_all
    paths = inspector.clean_all.reject{|p| p.include?('/system/') }
    run(paths, all: true)
  end
end