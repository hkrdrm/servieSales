ServieSales::Admin.controllers :servers do
  get :index do
    @title = "Servers"
    @servers = Server.all
    render 'servers/index'
  end

  get :new do
    @title = pat(:new_title, :model => 'server')
    @server = Server.new
    render 'servers/new'
  end

  post :create do
    @server = Server.new(params[:server])
    if @server.save
      @title = pat(:create_title, :model => "server #{@server.id}")
      flash[:success] = pat(:create_success, :model => 'Server')
      params[:save_and_continue] ? redirect(url(:servers, :index)) : redirect(url(:servers, :edit, :id => @server.id))
    else
      @title = pat(:create_title, :model => 'server')
      flash.now[:error] = pat(:create_error, :model => 'server')
      render 'servers/new'
    end
  end

  get :edit, :with => :id do
    @title = pat(:edit_title, :model => "server #{params[:id]}")
    @server = Server.find(params[:id])
    if @server
      render 'servers/edit'
    else
      flash[:warning] = pat(:create_error, :model => 'server', :id => "#{params[:id]}")
      halt 404
    end
  end

  put :update, :with => :id do
    @title = pat(:update_title, :model => "server #{params[:id]}")
    @server = Server.find(params[:id])
    if @server
      if @server.update_attributes(params[:server])
        flash[:success] = pat(:update_success, :model => 'Server', :id =>  "#{params[:id]}")
        params[:save_and_continue] ?
          redirect(url(:servers, :index)) :
          redirect(url(:servers, :edit, :id => @server.id))
      else
        flash.now[:error] = pat(:update_error, :model => 'server')
        render 'servers/edit'
      end
    else
      flash[:warning] = pat(:update_warning, :model => 'server', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy, :with => :id do
    @title = "Servers"
    server = Server.find(params[:id])
    if server
      if server.destroy
        flash[:success] = pat(:delete_success, :model => 'Server', :id => "#{params[:id]}")
      else
        flash[:error] = pat(:delete_error, :model => 'server')
      end
      redirect url(:servers, :index)
    else
      flash[:warning] = pat(:delete_warning, :model => 'server', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy_many do
    @title = "Servers"
    unless params[:server_ids]
      flash[:error] = pat(:destroy_many_error, :model => 'server')
      redirect(url(:servers, :index))
    end
    ids = params[:server_ids].split(',').map(&:strip)
    servers = Server.find(ids)
    
    if Server.destroy servers
    
      flash[:success] = pat(:destroy_many_success, :model => 'Servers', :ids => "#{ids.to_sentence}")
    end
    redirect url(:servers, :index)
  end
end
