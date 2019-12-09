class PagesController < ApplicationController

  def index
  end

  def dashboard
  end

  def create_users
  	@user = User.new
  	@user.email 				= params[:email]
  	@user.password 				= params[:password]
  	@user.password_confirmation = params[:password]

    

    respond_to do |format|
      if @user.save
        format.html { redirect_to create_users_path, success: 'user was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render  @users}
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
	private

	  # Use callbacks to share common setup or constraints between actions.
	  def set_user
	    @user = User.find(params[:id])
	  end

	  # Never trust parameters from the scary internet, only allow the white list through.
	  def user_params
	    params.require(:user).permit(:email, :password, :password_confirmation)
	  end
end
