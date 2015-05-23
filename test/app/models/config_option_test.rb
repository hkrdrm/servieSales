require File.expand_path(File.dirname(__FILE__) + '/../../test_config.rb')

class ConfigOptionTest < Test::Unit::TestCase
  context "ConfigOption Model" do
    should 'construct new instance' do
      @config_option = ConfigOption.new
      assert_not_nil @config_option
    end
  end
end
