ServieSales::App.controllers :server_configs do

  get :tindex do
    'hello'
  end

  post :set do
    @server_config = ServerConfig.new(params[:server_config])
    @server_config.server_id = session[:server_id]
    if(@server_config.save)
      #use 0MQ to send config to server
      update_config(session[:server_id])
    end
  end

  get :index, :map => '/config_options/index' do
    @c_options = ConfigOption.all
    render 'index'
  end
  get :show, :map => '/server_configs/show/:sid' do
    @c_options = ConfigOption.all
    @server = Server.find_by_id(params[:sid])
    session[:server_id] = params[:sid]
    render 'show'
  end


  private
    # Using a private method to encapsulate the permissible parameters
    # is just a good pattern since you'll be able to reuse the same
    # permit list between create and update. Also, you can specialize
    # this method with per-user checking of permissible attributes.
    def server_configs_params
      params.require(:server_configs).permit(:database, :dbus)
    end

end
