ServieSales::App.controllers :servers do


  get :new, :map => '/servers/new/' do
    render 'servers/new'
  end

  post :create do
    @order = Order.getCurrentOrder(current_user.id)
    @server = Server.new(params[:server])
    @server.userId = current_user.id
    @server.ip = "192.168.0.2"
    if(@server.save)
      redirect('/orders/complete')
    else
      render "servers/new"
    end
  end

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

  get :show do

  end

end
