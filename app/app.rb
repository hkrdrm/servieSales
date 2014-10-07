module ServieSales
  class App < Padrino::Application
    register SassInitializer
    use ActiveRecord::ConnectionAdapters::ConnectionManagement
    register Padrino::Mailer
    register Padrino::Helpers

    enable :sessions
    set :protect_from_csrf, false


    get "/" do
      render 'static_pages/index'
    end
    

  end
end
