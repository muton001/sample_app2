class RegistrationsController < Devise::RegistrationsController

    def after_sign_up_path_for(resource)
        redirect_to user_path(resource)
#        redirect_to current_user
    end

 
private

    def sign_up_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end    

    def account_update_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password)
    end 


end
