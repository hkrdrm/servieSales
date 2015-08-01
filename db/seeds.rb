# Seed add you the ability to populate your db.
# We provide you a basic shell for interaction with the end user.
# So try some code like below:
#
#   name = shell.ask("What's your name?")
#   shell.say name
#

ConfigOption.create(:option => "database",                  :possible_settings => "/var/run/murmur.sqlite",         :user_editable => "true")
ConfigOption.create(:option => "dbus",                      :possible_settings => "session",                        :user_editable => "true")
ConfigOption.create(:option => "dbusservice",               :possible_settings => "net.sourceforge.mumble.murmur",  :user_editable => "true")
ConfigOption.create(:option => "ice",                       :possible_settings => "tcp -h 127.0.0.1 -p 6502",       :user_editable => "true")
ConfigOption.create(:option => "icesecretread",             :possible_settings => "letmelook",                      :user_editable => "true")
ConfigOption.create(:option => "icesecretwrite",            :possible_settings => "letmechangestuff",               :user_editable => "true")
ConfigOption.create(:option => "Murmur.PublishedEndpoints", :possible_settings => "tcp -h 123.4.1.1 -p 7000",       :user_editable => "true")
ConfigOption.create(:option => "autobanAttempts",           :possible_settings => "10",                             :user_editable => "true")
ConfigOption.create(:option => "autobanTimeframe",          :possible_settings => "120",                            :user_editable => "true")
ConfigOption.create(:option => "password",                  :possible_settings => "letmein",                        :user_editable => "true")
ConfigOption.create(:option => "uname",                     :possible_settings => "murmur",                         :user_editable => "true")
ConfigOption.create(:option => "obfuscate",                 :possible_settings => "true|false",                     :user_editable => "true")
ConfigOption.create(:option => "sendversion",               :possible_settings => "true|false",                     :user_editable => "true")
ConfigOption.create(:option => "allowping",                 :possible_settings => "true|false",                     :user_editable => "true")
ConfigOption.create(:option => "logfile",                   :possible_settings => "murmur.log",                     :user_editable => "true")
ConfigOption.create(:option => "logdays",                   :possible_settings => "31",                             :user_editable => "true")
ConfigOption.create(:option => "welcometext",               :possible_settings => "",                               :user_editable => "true")
ConfigOption.create(:option => "port",                      :possible_settings => "64738",                          :user_editable => "true")
ConfigOption.create(:option => "sslCert",                   :possible_settings => "cert.pem",                       :user_editable => "true")
ConfigOption.create(:option => "sslKey",                    :possible_settings => "key.pem",                        :user_editable => "true")
ConfigOption.create(:option => "bonjour",                   :possible_settings => "false",                          :user_editable => "true")
ConfigOption.create(:option => "bandwidth",                 :possible_settings => "130000",                         :user_editable => "true")
ConfigOption.create(:option => "timeout",                   :possible_settings => "30",                             :user_editable => "true")
ConfigOption.create(:option => "users",                     :possible_settings => "",                               :user_editable => "false")
ConfigOption.create(:option => "usersperchannel",           :possible_settings => "10",                             :user_editable => "true")
ConfigOption.create(:option => "channelname",               :possible_settings => "",                               :user_editable => "true")
ConfigOption.create(:option => "username",                  :possible_settings => "",                               :user_editable => "true")
ConfigOption.create(:option => "defaultchannel",            :possible_settings => "1",                              :user_editable => "true")
ConfigOption.create(:option => "rememberchannel",           :possible_settings => "true|false",                     :user_editable => "true")
ConfigOption.create(:option => "textmessagelength",         :possible_settings => "5000",                           :user_editable => "true")
ConfigOption.create(:option => "imagemessagelength",        :possible_settings => "131072",                         :user_editable => "true")
ConfigOption.create(:option => "allowhtml",                 :possible_settings => "true|false",                     :user_editable => "true")
ConfigOption.create(:option => "opusthreshold",             :possible_settings => "100",                            :user_editable => "true")
ConfigOption.create(:option => "registerName",              :possible_settings => "",                               :user_editable => "true")
ConfigOption.create(:option => "registerPassword",          :possible_settings => "",                               :user_editable => "true")
ConfigOption.create(:option => "registerUrl",               :possible_settings => "", :user_editable => "true")
ConfigOption.create(:option => "registerHostname",          :possible_settings => "", :user_editable => "true")
ConfigOption.create(:option => "suggestVersion",            :possible_settings => "", :user_editable => "true")
ConfigOption.create(:option => "suggestPositional",         :possible_settings => "", :user_editable => "true")
ConfigOption.create(:option => "suggestPushToTalk",         :possible_settings => "", :user_editable => "true")





#email     = shell.ask "Which email do you want use for logging into admin?"
#password  = shell.ask "Tell me the password to use:"

#shell.say ""

#account = Account.create(:email => email, :name => "Foo", :surname => "Bar", :password => password, :password_confirmation => password, :role => "admin")

#if account.valid?
#  shell.say "================================================================="
#  shell.say "Account has been successfully created, now you can login with:"
#  shell.say "================================================================="
#  shell.say "   email: #{email}"
#  shell.say "   password: #{password}"
#  shell.say "================================================================="
#else
#  shell.say "Sorry but some thing went wrong!"
#  shell.say ""
#  account.errors.full_messages.each { |m| shell.say "   - #{m}" }
#end

#shell.say ""
