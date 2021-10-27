class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :telephone_number, :is_active])
    end

  protect_from_forgery with: :exception
  private

  def after_sign_in_path_for(resource_or_scope)

    if resource_or_scope.is_a?(Admin)
        admin_root_path
    else
        root_path
    end
  end

  def after_sign_out_path_for(resource)

    if resource == :admin
      new_admin_session_path # ログアウト後に遷移するpathを設定
    else
      root_path
    end

  end

end
