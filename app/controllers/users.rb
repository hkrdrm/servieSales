ServieSales::App.controllers :users do
  
  get :index, :map => '/users/index' do
    @users = User.all
    render 'index'
  end

  get :show, :map => '/users/show/:username' do
    @user = User.find_by_username(params[:username])
    @servers = Server.where(:userId => @user.id)
    begin
      if @user.username == current_user.username
        render "users/show"
      else
        redirect('/')
      end
    rescue
      redirect('/')
    end
  end

  post :create do
    @user = User.new(params[:user])
    Stripe.api_key = ENV['STRIPE_SECRET_KEY']
    customer = Stripe::Customer.create(
      :email => @user.email
    )
    @user.stripeId = customer.id
    @user.displayName = @user.username
    @user.username = @user.username.downcase
    if @user.save
      redirect('/')
    else
      render 'new'
    end
  end

  get :new, :map => '/users/new' do
    @user = User.new
    render 'users/new'
  end

    


  # get :sample, :map => '/sample/url', :provides => [:any, :js] do
  #   case content_type
  #     when :js then ...
  #     else ...
  # end

  # get :foo, :with => :id do
  #   'Maps to url '/foo/#{params[:id]}''
  # end

end
