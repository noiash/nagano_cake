class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  private

   def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_a?(Admin)
        admins_orders_top_path
    else
        root_path
    end
  end

end
