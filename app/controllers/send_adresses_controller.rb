class SendAdressesController < ApplicationController
  before_action :set_send_adress, only: [:show, :edit, :update, :destroy]

  # GET /send_adresses
  # GET /send_adresses.json
  def index
    @send_adresses = SendAdress.all
  end

  # GET /send_adresses/1
  # GET /send_adresses/1.json
  def show
  end

  # GET /send_adresses/new
  def new
    @send_adress = SendAdress.new
  end

  # GET /send_adresses/1/edit
  def edit
  end

  # POST /send_adresses
  # POST /send_adresses.json
  def create
    @send_adress = SendAdress.new(send_adress_params)

    respond_to do |format|
      if @send_adress.save
        format.html { redirect_to @send_adress, notice: 'Send adress was successfully created.' }
        format.json { render :show, status: :created, location: @send_adress }
      else
        format.html { render :new }
        format.json { render json: @send_adress.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /send_adresses/1
  # PATCH/PUT /send_adresses/1.json
  def update
    respond_to do |format|
      if @send_adress.update(send_adress_params)
        format.html { redirect_to @send_adress, notice: 'Send adress was successfully updated.' }
        format.json { render :show, status: :ok, location: @send_adress }
      else
        format.html { render :edit }
        format.json { render json: @send_adress.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /send_adresses/1
  # DELETE /send_adresses/1.json
  def destroy
    @send_adress.destroy
    respond_to do |format|
      format.html { redirect_to send_adresses_url, notice: 'Send adress was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_send_adress
      @send_adress = SendAdress.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def send_adress_params
      params.require(:send_adress).permit(:send_family_name, :send_first_name, :send_family_kana, :send_first_kana, :post_number, :prefectures, :city, :address, :apartment, :tell_number, :sendscol, :user_id)
    end
end
