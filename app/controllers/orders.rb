require "stripe"
require 'date'
ServieSales::App.controllers :order do

  get :new, :map => '/orders/new' do
    #@subscriptions = Subscription.pluck(:name)
    @subscriptions = Subscription.all
    @pk = ENV["STRIPE_PUBLIC_KEY"]
    if current_user != nil
      render '/orders/new'
    else
      redirect('/')
    end
  end

  get :services, :map => '/orders/services' do
    render 'orders/services'
  end

  get :checkoutComplete, :map => '/orders/checkoutComplete' do
    @order = Order.getCurrentOrder(current_user.id)
    @cart = Cart.new(session[:cart])

    @cart.items.each do |item|
      server = Server.new(:name => item['name'],
                          :password => item['password'],
                          :superUserPassword => item['superUserPassword'],
                          :slots => item['slots'])
      server.userId = current_user.id
      server.ip = "192.168.0.2"
      server.expires = session[:expires]
      if(server.save)
        #str = create_server(server.id)
      else
        # Need to redirect to error page if save fails
      end
    end

    render 'orders/checkoutComplete'
  end

  get :complete, :map => '/orders/complete' do
    render 'orders/complete'
  end

  post :create do
    @cart = Cart.new(session['cart'])
    # Set your secret key: remember to change this to your live secret key in production
    # See your keys here https://dashboard.stripe.com/account
    Stripe.api_key = ENV['STRIPE_SECRET_KEY']

    # Get the credit card details submitted by the form
    token = params[:stripeToken]
    @order = Order.new
    @order.userId = current_user.id.to_i
    @order.price = (@cart.total_price * 100).to_i

    customer = Stripe::Customer.retrieve(current_user.stripeId)
    customer.source = token
    @cart.items.each do |item|
      subscription = customer.subscriptions.create(:plan => "mumbleMonthly",
                                                   :quantity => item['nSlots'])
      session[:expires] = DateTime.strptime(subscription.current_period_end.to_s, '%s')
    end

    if(@order.save)
      redirect('/orders/checkoutComplete')
    else
      render 'orders/new'
    end

  end


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


end
