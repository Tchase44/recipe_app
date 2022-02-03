class IngredientsController < ApplicationController
  # before_action :authenticate_user!
  rescue_from ActiveRecord::RecordNotFound, :with => :ingredient_not_found

  def all
    @ingredients = Ingredient.all
    render "layouts/ingredients/index.json.jbuilder"
  end

  def index
    @ingredients = Recipe.find(params[:recipe_id]).ingredients
    render "layouts/ingredients/index.json.jbuilder"
  end

  def show
    @ingredient = Ingredient.find(params[:id])
    render "layouts/ingredients/show.json.jbuilder"
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
      render "layouts/ingredients/show.json.jbuilder"
    else
      render json: {message: "Failed to Save", error: @ingredient.errors}, status: 400
    end
  end

  def update
    @ingredient = Ingredient.find(params[:id])
    # if @ingredient.recipe_id == params[:recipe_id]
    if @ingredient.update(ingredient_params)
      render "layouts/ingredients/show.json.jbuilder"
    else
      render json: { message: "Failed to Update", error: @ingredient.errors }, status: 400
    end
    # else
    #   render json: { message: "Failed to Update, Mismatched Recipe", error: @ingredient.errors }, status: 400
    # end
  end

  def destroy
    @ingredient = Ingredient.find(params[:id])
    if @ingredient.destroy
      render json: { message: "Success" },status: 204
    else
      render json: { message: "Faild to Delete", error: @ingredient.errors }, status: 400
    end
  end
  private

  def ingredient_params
    params.require(:ingredient).permit(:id, :name, :amount, :recipe_id, :tip)
  end

  def ingredient_not_found
    render json: {message: "Ingredient Not Found", status: 400}
  end
end
