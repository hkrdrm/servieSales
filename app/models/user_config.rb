class UserConfig < ActiveRecord::Base

  def create_file(user_id)
    user = User.find_by_id(user_id)

    #config_options = UserConfig.find_by_

  end
end
