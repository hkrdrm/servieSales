require File.expand_path(File.dirname(__FILE__) + '/../../test_config.rb')

class TeamTest < Test::Unit::TestCase
  context "Team Model" do
    should 'construct new instance' do
      @team = Team.new
      assert_not_nil @team
    end
  end
end
