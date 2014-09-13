ServieSales::App.controllers :webhook do

  Stripe.api_key = ENV['STRIPE_SECRET_KEY']
  require "json"
  
  post :webhook, :map => '/webhook' do
    event_json = JSON.parse(request.body.read)
    
    status 200
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
