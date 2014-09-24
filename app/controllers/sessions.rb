ServieSales::App.controllers :sessions do
  
  get :new, :map => "/login" do
    render 'new'
  end

  post :create do
    user = User.find_by_username(params[:username].downcase)
    
    if user != nil && user.password == params[:password]
      sign_in(user)
      redirect '/'
    else
      render 'new'
    end
  end

  get :destroy, :map => '/logout' do
    sign_out
    redirect '/'
  end

end
