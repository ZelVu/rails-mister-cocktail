class DosesController < ApplicationController
  before_action :set_dose, only: [:destroy]

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  
  def create
    id = params[:dose][:ingredient]
    @ingredient = Ingredient.find(id.to_i)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    @dose.ingredient = @ingredient
    if @dose.save!
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose.destroy
  end
end

private

    def set_dose
        @dose = Dose.find(params[:id])
    end


    def dose_params
        params.require(:dose).permit(:description)
    end


# 1 find the cockta