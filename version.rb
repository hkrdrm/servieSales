
if(ARGV.empty?)
  f = File.open("version.dat", "r")
  s = ''
  f.each_line do |line|
    s += line
  end
  f.close
  puts "Version: " + s
else
  f = File.open("version.dat", "w")
  f.write(ARGV[0])
end
