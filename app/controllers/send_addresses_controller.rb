class SendAddressesController < ApplicationController
  before_action :set_send_address, only: [:show, :edit, :update, :destroy]

  # GET /send_addresses
  # GET /send_addresses.json
  def index
    @send_addresses = SendAddress.all
  end

  # GET /send_addresses/1
  # GET /send_addresses/1.json
  def show
  end

  # GET /send_addresses/new
  def new
    @send_address = SendAddress.new
  end

  # GET /send_addresses/1/edit
  def edit
  end

  # POST /send_addresses
  # POST /send_addresses.json
  def create
    @send_address = SendAddress.new(send_address_params)

    respond_to do |format|
      if @send_address.save
        format.html { redirect_to @send_address, notice: 'Send address was successfully created.' }
        format.json { render :show, status: :created, location: @send_address }
      else
        format.html { render :new }
        format.json { render json: @send_address.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /send_addresses/1
  # PATCH/PUT /send_addresses/1.json
  def update
    respond_to do |format|
      if @send_address.update(send_address_params)
        format.html { redirect_to @send_address, notice: 'Send address was successfully updated.' }
        format.json { render :show, status: :ok, location: @send_address }
      else
        format.html { render :edit }
        format.json { render json: @send_address.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /send_addresses/1
  # DELETE /send_addresses/1.json
  def destroy
    @send_address.destroy
    respond_to do |format|
      format.html { redirect_to send_addresses_url, notice: 'Send address was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_send_address
      @send_address = SendAddress.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def send_address_params
      params.require(:send_address).permit(:send_family_name, :send_first_name, :send_family_kana, :send_first_kana, :post_number, :prefectures, :city, :address, :apartment, :tell_number, :sendscol, :user_id)
    end
end
