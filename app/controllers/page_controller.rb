class PageController < ApplicationController
    def home 
        if current_user
           if current_user.role = "administrador"
              redirect_to user_admin_path
           end
        end
    end
end
