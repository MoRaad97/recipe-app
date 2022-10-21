class RecipeFoodsController < ApplicationController
  def new
    @recipe_food = RecipeFood.new
    @recipe = Recipe.where(id: params[:recipe_id], user: current_user)
  end

  def create
    @recipe = Recipe.where(id: params[:recipe_id], user: current_user)
    @recipe_food = RecipeFood.new(params.permit(:quantity, :recipe_id))
    if @recipe_food.save
      redirect_to(recipe_url(@recipe), notice: 'New Ingredient has been added successfully!')
    else
      render(:new, alert: 'Error! Ingredient Can Not be Add')
    end
  end

  def destroy
    @recipe_food = RecipeFood.where(params.permit(:id, :recipe_id))
    @recipe_food.destroy
    redirect_to recipe_url(params[:recipe_id], notice: 'Ingredient has been deleted successfully!')
  end
end
