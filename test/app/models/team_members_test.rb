require File.expand_path(File.dirname(__FILE__) + '/../../test_config.rb')

class TeamMembersTest < Test::Unit::TestCase
  context "TeamMembers Model" do
    should 'construct new instance' do
      @team_members = TeamMembers.new
      assert_not_nil @team_members
    end
  end
end
