require "stripe"
ServieSales::App.controllers :order do
  
  get :index, :map => '/order/index' do
    #@subscriptions = Subscription.pluck(:name)
    @subscriptions = Subscription.all
    if current_user != nil
      render 'index'
    else
      redirect('/')
    end
  end

  post :create do
    # Set your secret key: remember to change this to your live secret key in production
    # See your keys here https://dashboard.stripe.com/account
    Stripe.api_key = ENV['STRIPE_SECRET_KEY']

    # Get the credit card details submitted by the form
    token = params[:stripeToken]

    customer = Stripe::Customer.retrieve(current_user.stripeId)
    customer.subscriptions.create(:plan => "10slot", :card => token)
    redirect('/')
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
