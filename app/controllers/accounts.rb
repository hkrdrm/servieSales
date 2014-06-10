ServieSales::App.controllers :accounts do
  
  get :index, :map => '/accounts/index' do
    @accounts = Account.all
    render 'index'
  end
  
  get :new do
    @account = Account.new
    render 'accounts/new'
  end

  get :show do

  end

  post :create do
    @account = Account.new(params[:account])
    if @account.save
    else
    end
  end

end
