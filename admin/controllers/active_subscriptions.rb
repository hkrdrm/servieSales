ServieSales::Admin.controllers :active_subscriptions do
  get :index do
    @title = "Active_subscriptions"
    @active_subscriptions = ActiveSubscription.all
    render 'active_subscriptions/index'
  end

  get :new do
    @title = pat(:new_title, :model => 'active_subscription')
    @active_subscription = ActiveSubscription.new
    render 'active_subscriptions/new'
  end

  post :create do
    @active_subscription = ActiveSubscription.new(params[:active_subscription])
    if @active_subscription.save
      @title = pat(:create_title, :model => "active_subscription #{@active_subscription.id}")
      flash[:success] = pat(:create_success, :model => 'ActiveSubscription')
      params[:save_and_continue] ? redirect(url(:active_subscriptions, :index)) : redirect(url(:active_subscriptions, :edit, :id => @active_subscription.id))
    else
      @title = pat(:create_title, :model => 'active_subscription')
      flash.now[:error] = pat(:create_error, :model => 'active_subscription')
      render 'active_subscriptions/new'
    end
  end

  get :edit, :with => :id do
    @title = pat(:edit_title, :model => "active_subscription #{params[:id]}")
    @active_subscription = ActiveSubscription.find(params[:id])
    if @active_subscription
      render 'active_subscriptions/edit'
    else
      flash[:warning] = pat(:create_error, :model => 'active_subscription', :id => "#{params[:id]}")
      halt 404
    end
  end

  put :update, :with => :id do
    @title = pat(:update_title, :model => "active_subscription #{params[:id]}")
    @active_subscription = ActiveSubscription.find(params[:id])
    if @active_subscription
      if @active_subscription.update_attributes(params[:active_subscription])
        flash[:success] = pat(:update_success, :model => 'Active_subscription', :id =>  "#{params[:id]}")
        params[:save_and_continue] ?
          redirect(url(:active_subscriptions, :index)) :
          redirect(url(:active_subscriptions, :edit, :id => @active_subscription.id))
      else
        flash.now[:error] = pat(:update_error, :model => 'active_subscription')
        render 'active_subscriptions/edit'
      end
    else
      flash[:warning] = pat(:update_warning, :model => 'active_subscription', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy, :with => :id do
    @title = "Active_subscriptions"
    active_subscription = ActiveSubscription.find(params[:id])
    if active_subscription
      if active_subscription.destroy
        flash[:success] = pat(:delete_success, :model => 'Active_subscription', :id => "#{params[:id]}")
      else
        flash[:error] = pat(:delete_error, :model => 'active_subscription')
      end
      redirect url(:active_subscriptions, :index)
    else
      flash[:warning] = pat(:delete_warning, :model => 'active_subscription', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy_many do
    @title = "Active_subscriptions"
    unless params[:active_subscription_ids]
      flash[:error] = pat(:destroy_many_error, :model => 'active_subscription')
      redirect(url(:active_subscriptions, :index))
    end
    ids = params[:active_subscription_ids].split(',').map(&:strip)
    active_subscriptions = ActiveSubscription.find(ids)
    
    if ActiveSubscription.destroy active_subscriptions
    
      flash[:success] = pat(:destroy_many_success, :model => 'Active_subscriptions', :ids => "#{ids.to_sentence}")
    end
    redirect url(:active_subscriptions, :index)
  end
end
