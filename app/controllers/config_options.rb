ServieSales::App.controllers :config_options do

  # get :index, :map => '/foo/bar' do
  #   session[:foo] = 'bar'
  #   render 'index'
  # end

  # get :sample, :map => '/sample/url', :provides => [:any, :js] do
  #   case content_type
  #     when :js then ...
  #     else ...
  # end

  # get :foo, :with => :id do
  #   'Maps to url '/foo/#{params[:id]}''
  # end

  # get '/example' do
  #   'Hello world!'
  # end

  get :tindex do
    'hello'
  end

  post :set do
    @config_option = new ConfigOption(params[:config_option])
    @config_option.server_id = session[:server_id]
    if(config_option.save)
      #use 0MQ to send config to server
    end
  end

  get :index, :map => '/config_options/index' do
    @c_options = ConfigOption.all
    render 'index'
  end
  get :show, :map => '/config_options/show/:sid' do
    @c_options = ConfigOption.all
    @server = Server.find_by_id(params[:sid])
    session[:server_id] = params[:sid]
    render 'show'
  end

end
