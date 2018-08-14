# require 'pry-byebug'
class CocktailsController < ApplicationController
  def index
    if params[:query].nil? || params[:query] == ''
      @cocktails = Cocktail.all
    else
      search = '%' + params[:query] + '%'
      @cocktails = Cocktail.where("name LIKE ?", search )
    end
  end

  def show
    # binding.pry
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new
    @review = Review.new
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.create(cocktail_params)
    if @cocktail.save
      redirect_to @cocktail, notice: 'cocktail was added'
    else
      render :new
    end
  end

  private
  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end
end
