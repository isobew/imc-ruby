class ImcController < ApplicationController
  before_action :set_imc, only: %i[ show update destroy ]

  # GET /imc
  def index
    @imc = Imc.all

    render json: @imc
  end

  # GET /imc/1
  def show
    render json: @imc
  end

  # POST /imc
  def create
    @imc = Imc.new(imc_params)

    if @imc.save
      render json: @imc, status: :created, location: @imc
    else
      render json: @imc.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /imc/1
  def update
    if @imc.update(imc_params)
      render json: @imc
    else
      render json: @imc.errors, status: :unprocessable_entity
    end
  end

  # DELETE /imc/1
  def destroy
    @imc.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_imc
      @imc = Imc.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def imc_params
      params.require(:imc).permit(:height, :weight, :imc, :classification, :obesity)
    end
end
