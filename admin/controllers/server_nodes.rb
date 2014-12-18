ServieSales::Admin.controllers :server_nodes do
  get :index do
    @title = "Server_nodes"
    @server_nodes = ServerNode.all
    render 'server_nodes/index'
  end

  get :new do
    @title = pat(:new_title, :model => 'server_node')
    @server_node = ServerNode.new
    render 'server_nodes/new'
  end

  post :create do
    @server_node = ServerNode.new(params[:server_node])
    if @server_node.save
      @title = pat(:create_title, :model => "server_node #{@server_node.id}")
      flash[:success] = pat(:create_success, :model => 'ServerNode')
      params[:save_and_continue] ? redirect(url(:server_nodes, :index)) : redirect(url(:server_nodes, :edit, :id => @server_node.id))
    else
      @title = pat(:create_title, :model => 'server_node')
      flash.now[:error] = pat(:create_error, :model => 'server_node')
      render 'server_nodes/new'
    end
  end

  get :edit, :with => :id do
    @title = pat(:edit_title, :model => "server_node #{params[:id]}")
    @server_node = ServerNode.find(params[:id])
    if @server_node
      render 'server_nodes/edit'
    else
      flash[:warning] = pat(:create_error, :model => 'server_node', :id => "#{params[:id]}")
      halt 404
    end
  end

  put :update, :with => :id do
    @title = pat(:update_title, :model => "server_node #{params[:id]}")
    @server_node = ServerNode.find(params[:id])
    if @server_node
      if @server_node.update_attributes(params[:server_node])
        flash[:success] = pat(:update_success, :model => 'Server_node', :id =>  "#{params[:id]}")
        params[:save_and_continue] ?
          redirect(url(:server_nodes, :index)) :
          redirect(url(:server_nodes, :edit, :id => @server_node.id))
      else
        flash.now[:error] = pat(:update_error, :model => 'server_node')
        render 'server_nodes/edit'
      end
    else
      flash[:warning] = pat(:update_warning, :model => 'server_node', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy, :with => :id do
    @title = "Server_nodes"
    server_node = ServerNode.find(params[:id])
    if server_node
      if server_node.destroy
        flash[:success] = pat(:delete_success, :model => 'Server_node', :id => "#{params[:id]}")
      else
        flash[:error] = pat(:delete_error, :model => 'server_node')
      end
      redirect url(:server_nodes, :index)
    else
      flash[:warning] = pat(:delete_warning, :model => 'server_node', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy_many do
    @title = "Server_nodes"
    unless params[:server_node_ids]
      flash[:error] = pat(:destroy_many_error, :model => 'server_node')
      redirect(url(:server_nodes, :index))
    end
    ids = params[:server_node_ids].split(',').map(&:strip)
    server_nodes = ServerNode.find(ids)
    
    if ServerNode.destroy server_nodes
    
      flash[:success] = pat(:destroy_many_success, :model => 'Server_nodes', :ids => "#{ids.to_sentence}")
    end
    redirect url(:server_nodes, :index)
  end
end
