ServieSales::App.controllers :users do
  
  get :index, :map => '/users/index' do
    @users = User.all
    render 'index'
  end

  get :show, :map => '/users/show/:username' do
    @user = User.find_by_username(params[:username])
    render "users/show"
  end

  post :create do
    @user = User.new(params[:user])
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
