require "stripe"
ServieSales::App.controllers :order do
  
  get :index, :map => '/orders/index' do
    #@subscriptions = Subscription.pluck(:name)
    @subscriptions = Subscription.all
    if current_user != nil
      render '/orders/index'
    else
      redirect('/')
    end
  end

  get :new, :map => '/orders/new' do
    render 'orders/new'
  end

  post :create do
    # Set your secret key: remember to change this to your live secret key in production
    # See your keys here https://dashboard.stripe.com/account
    Stripe.api_key = ENV['STRIPE_SECRET_KEY']

    # Get the credit card details submitted by the form
    token = params[:stripeToken]
    @order = Order.new(params[:order])
    @order.userId = current_user.id.to_i

    customer = Stripe::Customer.retrieve(current_user.stripeId)
    customer.subscriptions.create(:plan => @order.nSlots.to_s + "slot", :card => token)

    if(@order.save)
      redirect('/servers/new')
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
