class PasslostsController < ApplicationController
  before_action :set_passlost, only: [:show, :edit, :update, :destroy]

  # GET /passlosts
  # GET /passlosts.json
  def index
    @passlosts = Passlost.all
  end

  # GET /passlosts/1
  # GET /passlosts/1.json
  def show
    @result=Passlost.CalculateFreeSpace @passlost.carrierFrequency
  end

  # GET /passlosts/new
  def new
    @passlost = current_user.passlosts.build
  end
  # GET /passlosts/1/edit
  def edit
  end

  # POST /passlosts
  # POST /passlosts.json
  def create
    @passlost = current_user.passlosts.build(passlost_params)

    respond_to do |format|
      if @passlost.save
        format.html { redirect_to @passlost, notice: 'Passlost was successfully created.' }
        format.json { render :show, status: :created, location: @passlost }
      else
        format.html { render :new }
        format.json { render json: @passlost.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /passlosts/1
  # PATCH/PUT /passlosts/1.json
  def update
    respond_to do |format|
      if @passlost.update(passlost_params)
        format.html { redirect_to @passlost, notice: 'Passlost was successfully updated.' }
        format.json { render :show, status: :ok, location: @passlost }
      else
        format.html { render :edit }
        format.json { render json: @passlost.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /passlosts/1
  # DELETE /passlosts/1.json
  def destroy
    @passlost.destroy
    respond_to do |format|
      format.html { redirect_to passlosts_url, notice: 'Passlost was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_passlost
      @passlost = Passlost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def passlost_params
      params.require(:passlost).permit(:trSeparation, :carrierFrequency, :txAntennaHeight, :rxAntennaHeight, :user_id)
    end
end
