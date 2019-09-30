class SessionsController < ApplicationController
    def new
        @user = User.new
    end 

    def create
        # even-though it says user_name is selecting the id value when selecting from dropdown
        @user = User.find_by(id: params[:user_name])
        
        if @user && @user.authenticate(params[:password])
            login(@user)
            redirect_to user_path(@user)
        else
            render 'new'
        end     
    end

    def destroy
        session.delete :user_id
        redirect_to root_path
    end 

    private

    def user_params
        params.require(:user).permit(
            :user_name,
            :password
        )
    end 

end
