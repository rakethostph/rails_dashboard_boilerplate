class PagesController < ApplicationController
  before_action :authenticate_user!, except:[:index]
  def index
  end

  def dashboard
    @distributor = User.accessible_by(current_ability).count

    @clients = Warranty.where(agent_id: current_user.id).count
    @warranties = Warranty.where(agent_id: current_user.id).count
    @sold_product = Warranty.where(created_at: (30.days.ago..Time.now), agent_id: current_user.id).count

    @product_sold = Warranty.all

    @admin_distributor = Role.joins(:users).where(name: :distributor).count
    @admin_agent = Role.joins(:users).where(name: :agent).count
    @admin_client = Role.joins(:users).where(name: :client).count
    @admin_warranties = Warranty.all.count


    @product_bought = Warranty.where(client_id: current_user.id).count

  end

  def distributor_page
  	
  end

  def agent_page
  	@agents = Profile.joins(:user).where(distributor_id: current_user.id).all
  end

  def client_page
    @users = Warranty.where(agent_id: current_user.id).all
  end




end
