class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def new
    @cocktail = Cocktail.new
    @cocktail.save
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save 
      redirect_to @cocktail
    else
      render :new
    end
  end

  def edit
    @cocktail = Cocktail.find(params[:id])
  end

  def update
    if @cocktail.update(cocktail_params)
      redirect_to @cocktail, notice: 'Cocktail was successfully updated.'
    else
      render :edit
    end
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :description, :cocktail, :ingredient)
  end
end
