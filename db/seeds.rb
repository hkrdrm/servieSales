# Seed add you the ability to populate your db.
# We provide you a basic shell for interaction with the end user.
# So try some code like below:
#
#   name = shell.ask("What's your name?")
#   shell.say name
#

ConfigOption.create(:option => "database", :possible_settings => "/var/run/murmur.sqlite")
ConfigOption.create(:option => "dbus", :possible_settings => "session")
ConfigOption.create(:option => "dbusservice", :possible_settings => "net.sourceforge.mumble.murmur")
ConfigOption.create(:option => "ice", :possible_settings => "tcp -h 127.0.0.1 -p 6502")
ConfigOption.create(:option => "icesecretread", :possible_settings => "letmelook")
ConfigOption.create(:option => "icesecretwrite", :possible_settings => "letmechangestuff")
ConfigOption.create(:option => "Murmur.PublishedEndpoints", :possible_settings => "tcp -h 123.4.1.1 -p 7000")
ConfigOption.create(:option => "autobanAttempts", :possible_settings => "10")
ConfigOption.create(:option => "autobanTimeframe", :possible_settings => "120")
ConfigOption.create(:option => "autobanTime", :possible_settings => "300")

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
