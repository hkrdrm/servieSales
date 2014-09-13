ServieSales::Admin.controllers :server_instances do
  get :index do
    @title = "Server_instances"
    @server_instances = ServerInstances.all
    render 'server_instances/index'
  end

  get :new do
    @title = pat(:new_title, :model => 'server_instances')
    @server_instances = ServerInstances.new
    render 'server_instances/new'
  end

  post :create do
    @server_instances = ServerInstances.new(params[:server_instances])
    if @server_instances.save
      @title = pat(:create_title, :model => "server_instances #{@server_instances.id}")
      flash[:success] = pat(:create_success, :model => 'ServerInstances')
      params[:save_and_continue] ? redirect(url(:server_instances, :index)) : redirect(url(:server_instances, :edit, :id => @server_instances.id))
    else
      @title = pat(:create_title, :model => 'server_instances')
      flash.now[:error] = pat(:create_error, :model => 'server_instances')
      render 'server_instances/new'
    end
  end

  get :edit, :with => :id do
    @title = pat(:edit_title, :model => "server_instances #{params[:id]}")
    @server_instances = ServerInstances.find(params[:id])
    if @server_instances
      render 'server_instances/edit'
    else
      flash[:warning] = pat(:create_error, :model => 'server_instances', :id => "#{params[:id]}")
      halt 404
    end
  end

  put :update, :with => :id do
    @title = pat(:update_title, :model => "server_instances #{params[:id]}")
    @server_instances = ServerInstances.find(params[:id])
    if @server_instances
      if @server_instances.update_attributes(params[:server_instances])
        flash[:success] = pat(:update_success, :model => 'Server_instances', :id =>  "#{params[:id]}")
        params[:save_and_continue] ?
          redirect(url(:server_instances, :index)) :
          redirect(url(:server_instances, :edit, :id => @server_instances.id))
      else
        flash.now[:error] = pat(:update_error, :model => 'server_instances')
        render 'server_instances/edit'
      end
    else
      flash[:warning] = pat(:update_warning, :model => 'server_instances', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy, :with => :id do
    @title = "Server_instances"
    server_instances = ServerInstances.find(params[:id])
    if server_instances
      if server_instances.destroy
        flash[:success] = pat(:delete_success, :model => 'Server_instances', :id => "#{params[:id]}")
      else
        flash[:error] = pat(:delete_error, :model => 'server_instances')
      end
      redirect url(:server_instances, :index)
    else
      flash[:warning] = pat(:delete_warning, :model => 'server_instances', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy_many do
    @title = "Server_instances"
    unless params[:server_instances_ids]
      flash[:error] = pat(:destroy_many_error, :model => 'server_instances')
      redirect(url(:server_instances, :index))
    end
    ids = params[:server_instances_ids].split(',').map(&:strip)
    server_instances = ServerInstances.find(ids)
    
    if ServerInstances.destroy server_instances
    
      flash[:success] = pat(:destroy_many_success, :model => 'Server_instances', :ids => "#{ids.to_sentence}")
    end
    redirect url(:server_instances, :index)
  end
end
