class WarrantiesController < ApplicationController
  before_action :set_warranty, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /warranties
  # GET /warranties.json
  def index
    @warranties = Warranty.all

  end

  # GET /warranties/1
  # GET /warranties/1.json
  def show
  end

  # GET /warranties/new
  def new
    if current_user.has_role? :admin
      @warranty = Warranty.new
    elsif current_user.has_role? :distributor
      @warranty = Warranty.new
    elsif current_user.has_role? :agent
      @warranty = Warranty.new
    else
      redirect_to warranties_path, alert: 'You are not allowed to create new products please contact admin.' 
    end

  end

  # GET /warranties/1/edit
  def edit
  end

  # POST /warranties
  # POST /warranties.json
  def create
    @warranty = Warranty.new(warranty_params)
    @warranty.agent_id =  current_user.id
    @user = User.find(current_user.id)
    @warranty.distributor_id = @user.distributor_id
    @warranty.sale_date = Date.today
    @warranty.start_time = Date.today
    @warranty.expiry_date =  (Date.today + 5.year)
    respond_to do |format|
      if @warranty.save
        format.html { redirect_to @warranty, notice: 'Warranty was successfully created.' }
        format.json { render :show, status: :created, location: @warranty }
      else
        format.html { render :new }
        format.json { render json: @warranty.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /warranties/1
  # PATCH/PUT /warranties/1.json
  def update
    respond_to do |format|
      if @warranty.update(warranty_params)
        format.html { redirect_to @warranty, notice: 'Warranty was successfully updated.' }
        format.json { render :show, status: :ok, location: @warranty }
      else
        format.html { render :edit }
        format.json { render json: @warranty.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /warranties/1
  # DELETE /warranties/1.json
  def destroy
    @warranty.destroy
    respond_to do |format|
      format.html { redirect_to warranties_url, notice: 'Warranty was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_warranty
      @warranty = Warranty.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def warranty_params
      params.require(:warranty).permit(:product_name, :product_serial_number, :client_id, :product_id, :agent_id)
    end
end
