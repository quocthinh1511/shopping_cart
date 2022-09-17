class CategoriesController < ApplicationController
  def index
      @categories = Category.all
  end

  def new
      @category = Category.new
  end


  def create
      @category = Category.new(category_params)
      if @category.save
          redirect_to categories_url
      else
          render :new
      end
  end

  # Only allow a list of trusted parameters through.
  def category_params
    params.require(:category).permit(:name)
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_category
    @category = Category.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def category_params
    params.require(:category).permit(:name)
  end
end
