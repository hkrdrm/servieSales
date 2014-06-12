ServieSales::Admin.controllers :subscriptions do
  get :index do
    @title = "Subscriptions"
    @subscriptions = Subscription.all
    render 'subscriptions/index'
  end

  get :new do
    @title = pat(:new_title, :model => 'subscription')
    @subscription = Subscription.new
    render 'subscriptions/new'
  end

  post :create do
    @subscription = Subscription.new(params[:subscription])
    if @subscription.save
      @title = pat(:create_title, :model => "subscription #{@subscription.id}")
      flash[:success] = pat(:create_success, :model => 'Subscription')
      params[:save_and_continue] ? redirect(url(:subscriptions, :index)) : redirect(url(:subscriptions, :edit, :id => @subscription.id))
    else
      @title = pat(:create_title, :model => 'subscription')
      flash.now[:error] = pat(:create_error, :model => 'subscription')
      render 'subscriptions/new'
    end
  end

  get :edit, :with => :id do
    @title = pat(:edit_title, :model => "subscription #{params[:id]}")
    @subscription = Subscription.find(params[:id])
    if @subscription
      render 'subscriptions/edit'
    else
      flash[:warning] = pat(:create_error, :model => 'subscription', :id => "#{params[:id]}")
      halt 404
    end
  end

  put :update, :with => :id do
    @title = pat(:update_title, :model => "subscription #{params[:id]}")
    @subscription = Subscription.find(params[:id])
    if @subscription
      if @subscription.update_attributes(params[:subscription])
        flash[:success] = pat(:update_success, :model => 'Subscription', :id =>  "#{params[:id]}")
        params[:save_and_continue] ?
          redirect(url(:subscriptions, :index)) :
          redirect(url(:subscriptions, :edit, :id => @subscription.id))
      else
        flash.now[:error] = pat(:update_error, :model => 'subscription')
        render 'subscriptions/edit'
      end
    else
      flash[:warning] = pat(:update_warning, :model => 'subscription', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy, :with => :id do
    @title = "Subscriptions"
    subscription = Subscription.find(params[:id])
    if subscription
      if subscription.destroy
        flash[:success] = pat(:delete_success, :model => 'Subscription', :id => "#{params[:id]}")
      else
        flash[:error] = pat(:delete_error, :model => 'subscription')
      end
      redirect url(:subscriptions, :index)
    else
      flash[:warning] = pat(:delete_warning, :model => 'subscription', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy_many do
    @title = "Subscriptions"
    unless params[:subscription_ids]
      flash[:error] = pat(:destroy_many_error, :model => 'subscription')
      redirect(url(:subscriptions, :index))
    end
    ids = params[:subscription_ids].split(',').map(&:strip)
    subscriptions = Subscription.find(ids)
    
    if Subscription.destroy subscriptions
    
      flash[:success] = pat(:destroy_many_success, :model => 'Subscriptions', :ids => "#{ids.to_sentence}")
    end
    redirect url(:subscriptions, :index)
  end
end
