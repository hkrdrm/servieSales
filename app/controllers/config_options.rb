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
  end

  get :index, :map => '/config_options/index' do
    @c_options = ConfigOption.all
    render 'index'
  end

end
