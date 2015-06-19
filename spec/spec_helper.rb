require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'basic_ruby'

RSpec.configure do |config|
  # silence any log output during testing to keep test results clean
  # if you want to see the results of puts command during test you can
  # remove the $stdout redirection
  original_stderr = $stderr
  original_stdout = $stdout

  config.before(:all) do
    # Redirect stderr and stdout
    $stderr = File.open(File::NULL, "w")
    $stdout = File.open(File::NULL, "w")
  end

  config.after(:all) do
    $stderr = original_stderr
    $stdout = original_stdout
  end

end