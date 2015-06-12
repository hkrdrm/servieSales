require 'active_record'
require 'mysql2' # or 'pg' or 'sqlite3'

# Change the following to reflect your database settings
ActiveRecord::Base.establish_connection(
  adapter:  'mysql2', # or 'postgresql' or 'sqlite3'
  host:     'localhost',
  database: 'servieSales_development',
  username: 'root',
  password: 'nickel.109'
)
require "../app/models/config_option.rb"

c_opts = ConfigOption.all

s = ""
c_opts.each do |opt|
  if(opt.user_editable == true)
    s << "  %p\n"
    s << "    = form.label :#{opt.option}, :class => \"config\", :caption => \"#{opt.option}\"\n"
    s << "    = form.text_field :#{opt.option}, :id => \"#{opt.option}\"\n\n"
  end
end
puts s
