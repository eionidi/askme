class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :set_locale
  # метод-помощник, доступный во вьюхах
  helper_method :current_user

  private

  # хелпер, достающий текущего юзера по данным аутентификации в сессии
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  # редиректит юзера на главную с предупреждением
  def reject_user
    redirect_to root_path, alert: 'Вам сюда низя!'
  end

  def set_locale
    I18n.locale = params[:locale]
  end
end
