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
    @admin_warranties = Warranty.count
    


    @product_bought = Warranty.where(client_id: current_user.id).count


    # from = start.beginning_of_day
    # to   = Time.zone.now
    # Rating.group('date(created_at)').where(created_at: from .. to).count(:client_id)

    # @product_by_date = @admin_warranties.group_by(&:created_at)

  end

  def distributor_page
  	
  end

  def agent_page
  	@agents = User.includes(:profile).where(distributor_id: current_user.id).all

  end

  def client_page
    @users = Warranty.where(agent_id: current_user.id).all
  end




end
