class DosesController < ApplicationController
  def index
    @doses = Dose.all
  end

  def show
    @dose = Dose.find(params[:id])
  end

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new()
  end

  def create        # POST /cocktails
    @dose = Dose.new(dose_params)
    @dose.cocktail = Cocktail.find(params[:cocktail_id])
    @cocktail = @dose.cocktail
    if @dose.save
      redirect_to cocktail_path(@dose.cocktail)
    else
      render :new
    end
  end
  
  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end


  # def edit          # GET /articles/:id/edit
  #   @dose = Dose.find(params[:id])
  # end

  # def update
  #   @dose = Dose.find(params[:id])
  #   @dose.update(dose_params)
  #   redirect_to dose_path(@dose)
  # end

  
  private

  def dose_params
    params.require(:dose).permit(:description,:cocktail_id, :ingredient_id, :amount)
  end


end