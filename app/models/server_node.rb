class ServerNode < ActiveRecord::Base
  after_save :initialize_counter

  def initialize_counter
    id = self.id
    if($redis.EXISTS("node_id:#{id}") == 0)
      $redis.INCRBY("node_id:#{id}", 3000)
    end
  end

end
