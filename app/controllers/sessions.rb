ServieSales::App.controllers :sessions do

  get :new, :map => "/login" do
    render 'new'
  end

  post :create do
    if user = User.authenticate(params[:username], params[:password])
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
