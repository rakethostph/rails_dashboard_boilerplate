class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.includes(:roles).where.not(:id => current_user.id)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
      
    if current_user.has_role? :admin
      @user.add_role params[:user][:role]
      @user.admin_id = current_user.id
    elsif current_user.has_role? :distributor
      @user.add_role :agent
      @user.distributor_id = current_user.id
    end
    

    if @user.save
      flash[:notice] = "Successfully created User." 
      redirect_to users_path
    else
      render :action => 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    params[:user].delete(:password) if params[:user][:password].blank?
    params[:user].delete(:password_confirmation) if params[:user][:password].blank? and params[:user][:password_confirmation].blank?
    if @user.has_role? :admin
      @user.add_role params[:roles]
    end
    if @user.update(user_params)
      flash[:notice] = "Successfully updated User."
      redirect_to users_path
    else
      render :action => 'edit'
    end
  end

  def authorize_admin
    redirect_to authenticated_root_path, alert: 'Access Denied' unless current_user.admin?
  end


  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:notice] = "Successfully deleted User."
      redirect_to users_path
    end
  end 
  private

  def user_params
     params.require(:user).permit(:email, :password, :password_confirmation, :admin_id, :distributor_id, :agent_id, :client_id)
  end
end