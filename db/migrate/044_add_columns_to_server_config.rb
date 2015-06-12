class AddColumnsToServerConfig < ActiveRecord::Migration
  def self.up
    add_column :server_configs, :database,                      :string
    add_column :server_configs, :dbus,                          :string
    add_column :server_configs, :dbusservice,                   :string
    add_column :server_configs, :ice,                           :string
    add_column :server_configs, :icesecretread,                 :string
    add_column :server_configs, :icesecretwrite,                :string
    add_column :server_configs, :MurmurPublishedEndpoints,      :string
    add_column :server_configs, :autobanAttempts,               :string
    add_column :server_configs, :autobanTimeframe,              :string
    add_column :server_configs, :uname,                         :string
    add_column :server_configs, :obfuscate,                     :string
    add_column :server_configs, :sendversion,                   :string
    add_column :server_configs, :allowping,                     :string
    add_column :server_configs, :logdays,                       :string
    add_column :server_configs, :welcometext,                   :string
    add_column :server_configs, :port,                          :string
    add_column :server_configs, :sslCert,                       :string
    add_column :server_configs, :sslKey,                        :string
    add_column :server_configs, :bonjour,                       :string
    add_column :server_configs, :bandwidth,                     :string
    add_column :server_configs, :timeout,                       :string
    add_column :server_configs, :users,                         :string
    add_column :server_configs, :usersperchannel,               :string
    add_column :server_configs, :channelname,                   :string
    add_column :server_configs, :username,                      :string
    add_column :server_configs, :defaultchannel,                :string
    add_column :server_configs, :rememberchannel,               :string
    add_column :server_configs, :textmessagelength,             :string
    add_column :server_configs, :imagemessagelength,            :string
    add_column :server_configs, :allowhtml,                     :string
    add_column :server_configs, :opusthreshold,                 :string
    add_column :server_configs, :registerName,                  :string
    add_column :server_configs, :registerPassword,              :string
    add_column :server_configs, :registerUrl,                   :string
    add_column :server_configs, :registerHostname,              :string
    add_column :server_configs, :suggestVersion,                :string
    add_column :server_configs, :suggestPositional,             :string
    add_column :server_configs, :suggestPushToTalk,             :string
  end

  def self.down
    remove_column :server_configs, :database
    remove_column :server_configs, :dbus
    remove_column :server_configs, :dbusservice
    remove_column :server_configs, :ice
    remove_column :server_configs, :icesecretread
    remove_column :server_configs, :icesecretwrite
    remove_column :server_configs, :MurmurPublishedEndpoints
    remove_column :server_configs, :autobanAttempts
    remove_column :server_configs, :autobanTimeframe
    remove_column :server_configs, :uname
    remove_column :server_configs, :obfuscate
    remove_column :server_configs, :sendversion
    remove_column :server_configs, :allowping
    remove_column :server_configs, :logdays
    remove_column :server_configs, :welcometext
    remove_column :server_configs, :port
    remove_column :server_configs, :sslCert
    remove_column :server_configs, :sslKey
    remove_column :server_configs, :bonjour
    remove_column :server_configs, :bandwidth
    remove_column :server_configs, :timeout
    remove_column :server_configs, :users
    remove_column :server_configs, :usersperchannel
    remove_column :server_configs, :channelname
    remove_column :server_configs, :username
    remove_column :server_configs, :defaultchannel
    remove_column :server_configs, :rememberchannel
    remove_column :server_configs, :textmessagelength
    remove_column :server_configs, :imagemessagelength
    remove_column :server_configs, :allowhtml
    remove_column :server_configs, :opusthreshold
    remove_column :server_configs, :registerName
    remove_column :server_configs, :registerPassword
    remove_column :server_configs, :registerUrl
    remove_column :server_configs, :registerHostname
    remove_column :server_configs, :suggestVersion
    remove_column :server_configs, :suggestPositional
    remove_column :server_configs, :suggestPushToTalk
  end
end
