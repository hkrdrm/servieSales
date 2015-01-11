require 'ffi-rzmq'
require 'json'

def getStatus
  status = Hash.new
  status["percentFree"] = '%.2f' % `free | grep Mem | awk '{print $3/$2 * 100.0}'`
  status["free"] = `free -g | grep Mem | awk '{print $3}'`
  status["total"] = `free -g | grep Mem | awk '{print $2}'`
  status
end

def createServer(id)
  Thread.new(id){ |myId|
    system("VBoxManage clonevm testVM --name #{myId} --register")
    system("VBoxManage startvm #{myId} --type headless")
  }
  msg = Hash.new
  msg["status"] = "Server starting up will be ready shortly"
  msg["message"] = "cracker Jack"
  msg
end

def deleteServer
end

def serverNodeInit
end

puts "Starting node Server..."

context = ZMQ::Context.new

socket = context.socket(ZMQ::REP)
socket.bind("tcp://*:5555")

loop do
  request = ''
  socket.recv_string(request)

  puts "Received request. Data: #{request.inspect}"
  req_fn = ''
  begin
    req_json = JSON.parse(request)
    req_fn   = req_json["fn"]
  rescue
  end

  if req_fn == "getStatus"
    socket.send_string(getStatus.to_json)
  elsif req_fn == "createServer"
    socket.send_string( createServer( req_json["param"] ).to_json )
  end
end
