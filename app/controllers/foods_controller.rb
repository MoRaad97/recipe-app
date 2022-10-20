class FoodsController < ApplicationController
  # GET /foods {food list page}
  def index
    @foods = Food.all
  end

  # GET /foods/1  {details Page}
  def show; end

  # GET /foods/new {create form page}
  def new
    @food = Food.new
  end

  # POST /foods {Create Action}
  def create
    @food = Food.new(food_params)
    if @food.save
      redirect_to foods_path, notice: 'Food was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # Delete Food Action
  def destroy
    @food = Food.find(params[:id])
    redirect_to foods_path, notice: 'Food was successfully destroyed.' if @food.destroy
  end

  private

  def food_params
    params.require(:food).permit(:name, :price, :measurement_unit, :user_id)
  end
end
