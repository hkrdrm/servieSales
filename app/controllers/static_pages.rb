ServieSales::App.controllers :static_pages do
  
  get :index, :map => 'index' do
    render 'index'
  end
  
  get :about, :map => '/static_pages/about' do
    render 'about'
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
