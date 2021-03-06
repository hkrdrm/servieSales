require 'json'
# Helper methods defined here can be accessed in any controller or view in the application

module ServieSales
  class App
    module SessionsHelper
      def current_user=(user)
        @current_user = user
      end

      def current_user
        @current_user ||= User.find_by_id(session[:current_user])
      end

      def sign_in(user)
        session[:current_user] = user.id
        @cart = Cart.new
        session[:cart] = @cart.id
        self.current_user = user
      end

      def sign_out
        session.delete(:current_user)
        @cart = Cart.new(session[:cart])
        @cart.delete_cart
        session.delete(:cart)
      end

      def signed_in?
        !current_user.nil?
      end

    end

    helpers SessionsHelper
  end
end
