class ApplicationController < ActionController::Base
  
   #before_action :authenticate_customer!, except: [:top, :about, :index]
   
    before_action :configure_permitted_parameters, if: :devise_controller?
    
    
    
    
    def admin_url
     request.fullpath.include?("/admin")
    end
    
    
     def after_sign_in_path_for(resource)
       if customer_signed_in?
        public_customer_path(@customer.id)# ログイン後に遷移するpathを設定
       else admin_signed_in?
        admin_root_path
       end
     end
     
     def after_sign_out_path_for(resource)
       if resource == :customer
         root_path
       elsif resource == :admin
         new_admin_session_path
       else
         root_path
       end
     end
    
    
    

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :telephone_number])
  end
end
