class ImcController < ApplicationController
  skip_before_action :authenticate_request, only: %i[ create ]
  before_action :set_imc, only: %i[ show update destroy ]

  # POST /imc
  def create
    @imc = Imc.new(imc_params)

    if @imc.save
      imc = (@imc.weight / (@imc.height * @imc.height)).round(2)
      @imc.imc = imc
      
      case @imc.imc
      when ..18.5
        @imc.classification = "Magreza"
        @imc.obesity = "O"
      when 18.5..24.9
        @imc.classification = "Normal"
        @imc.obesity = "O"
      when 25.0..29.9
        @imc.classification = "Sobrepeso"
        @imc.obesity = "I"
      when 30.0..39.9
        @imc.classification = "Obesidade"
        @imc.obesity = "II"
      else
        @imc.classification = "Obesidade grave"
        @imc.obesity = "III"
      end
      
      render json: {
          imc: @imc.imc, 
          classification: @imc.classification, 
          obesity: @imc.obesity,
        }, 
        status: :created, 
        location: @imc
      else
        render json: @imc.errors, status: :unprocessable_entity
      end
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_imc
      @imc = Imc.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def imc_params
      params.require(:imc).permit(:height, :weight)
    end
end
