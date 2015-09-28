class Server < ActiveRecord::Base
  attr_accessor :node_id
  before_save :get_port

  def get_port
    id = self.node_id
    port = $redis.INCRBY("node_id:#{id}", 5)
    self.port = port
  end
end
