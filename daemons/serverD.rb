require 'ffi-rzmq'
require 'json'

puts "Starting ServerDaemon..."

context = ZMQ::Context.new

socket = context.socket(ZMQ::REP)
socket.bind("tcp://*:5555")

loop do
  request = ''
  socket.recv_string(request)

  puts "Received request. Data: #{request.inspect}"

  file = File.open("/home/hkrdrm/sample.txt", "w")
  file.puts request.inspect
  file.close
  socket.send_string("yah")
  #req_fn = ''
  #begin
  #  req_json = JSON.parse(request)
  #  req_fn   = req_json["fn"]
  #rescue
  #end

  #if req_fn == "update_config"
  #  socket.send_string(getStatus.to_json)
  #end
end

def update_config
  #/etc/mumble-server.ini
end
