ServieSales::App.controllers :static_pages do
  
  get :index, :map => 'static_pages/index' do
    render 'index'
  end
  
  get :about, :map => 'static_pages/about_us' do
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
