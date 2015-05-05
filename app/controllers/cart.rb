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
    @cart = Cart.new(session[:cart])
    @order = Hash.new
    @order = params[:order]
    @cart.add_product(1, @order)
    redirect 'cart/index'
  end

  get :deleteProduct, :map => 'cart/deleteProduct/:id' do
    @cart = Cart.new(session[:cart])
    if(@cart.count == 1)
      session[:cart] = nil
    end
    @cart.delete_item(params[:id])
    redirect 'cart/index'
  end

  get :test, :map => 'cart/test' do
  end

  get :index, :map => 'cart/index' do
    @cart = Cart.new(session[:cart])
    render 'index'
  end

end
