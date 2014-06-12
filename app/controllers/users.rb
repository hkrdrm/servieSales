ServieSales::App.controllers :users do
  
  get :index, :map => '/users/index' do
    @users = User.all
    render 'index'
  end

 # get :show, :map => '/users/:email' do
 #   @user = User.find(params[:email])
 #   @title = @user.email
 #   render "users/email"
 # end

  post :create do
    @user = User.new(params[:user])
    begin
      @user.save
      flash[:success] = "whoop whoop!"
    rescue
      flash.now[:error] = "no no"
      render 'users/new'
    end
  end

  get :new do
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
