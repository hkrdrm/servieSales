ServieSales::App.controllers :servers do


  get :new, :map => '/servers/new/' do
    render 'servers/new'
  end

  post :create, :map => 'servers/create/' do
    @order = Order.getCurrentOrder(current_user.id)
    @server = Server.new(params[:server])
    @server.userId = current_user.id
    @server.ip = "192.168.0.2"
    @server.expires = session[:expires]
    if(@server.save)
      str = create_server(@server.id)
      redirect('/orders/checkoutComplete')
    else
      render "servers/new"
    end
  end

  get :show, :map => '/servers/show/:sid' do
    @server = Server.find_by_id(params[:sid])
    render "servers/show"
  end

  get :endSubscription, :map => '/servers/endSubscription/:sid' do
    server = Server.find_by_id(params[:sid])
    Stripe.api_key = ENV['STRIPE_SECRET_KEY']
    customer = Stripe::Customer.retrieve(current_user.stripeId)
    subscription = customer.subscriptions.retrieve(server.subscriptionId).delete
    server.subscriptionId = nil
    server.save
    redirect("/servers/show/#{server.id}")
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
