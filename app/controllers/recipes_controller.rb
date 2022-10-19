class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to recipes_path, notice: 'Recipe created successfully!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    # @recipe, = Recipe.where(id: params[:id], user: current_user)
    # @recipe_foods = @recipe.recipe_foods.includes(:food)
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    redirect_to recipes_path, notice: 'Recipe deleted!' if @recipe.destroy
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description)
  end
end
