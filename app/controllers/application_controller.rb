class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  #以下、新規登録時に入力したnameをDBに保存するための記述(参照: https://qiita.com/Orangina1050/items/a16e655519a60f35b394)
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # 新規登録時(sign_up時)にnameというキーのパラメーターを追加で許可する(ストロングパラメーターの追加)
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name]) 
  end
end
