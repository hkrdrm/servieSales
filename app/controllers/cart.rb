ServieSales::App.controllers :cart do

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

  post :addProduct, :map => 'cart/addProduct' do
    @cart = session[:cart]
    @order = Hash.new
    @order = params[:order]
    @cart.add_product(1, @order)
    render 'cart/index'
  end

  get :index, :map => 'cart/index' do
    @cart = session[:cart]
    render 'index'
  end

end
