module ServieSales
  class App < Padrino::Application
    register SassInitializer
    use ActiveRecord::ConnectionAdapters::ConnectionManagement
    register Padrino::Mailer
    register Padrino::Helpers
    register Padrino::Warden

    enable :sessions
    set :protect_from_csrf, false


    get "/" do
      render 'static_pages/index'
    end
    
    get :about, :map => '/about_us' do
      render :haml, "%p Providing you the world's fastest ventrillo servers ect... shit..."
    end

  end
end
