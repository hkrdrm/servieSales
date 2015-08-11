ServieSales::App.controllers :server_nodes do

  get :index, :map => '/server_nodes/index' do
    if(current_user.admin == true)
      @serverNodes = ServerNode.all
      render 'index'
    else
      redirect('/')
    end
  end

  get :show do

  end

end
