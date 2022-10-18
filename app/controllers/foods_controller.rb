class FoodsController < ApplicationController
  before_action :set_food, only: %i[ show edit update destroy ]

  # GET /foods {food list page}
  def index
    @foods = Food.all
  end

  # GET /foods/1  {details Page}
  def show
  end

  # GET /foods/new {create form page}
  def new
    @food = Food.new
  end

  # POST /foods {Create Action} 
  def create
    @food = Food.new(food_params)

    respond_to do |format|
      if @food.save
        format.html { redirect_to foods_path, notice: "Food was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # Delete Food Action
  def destroy
    @food.destroy

    respond_to do |format|
      format.html { redirect_to foods_url, notice: "Food was successfully destroyed." }
    end
  end

  private

  def food_params
    params.require(:food).permit(:name, :price, :measurement_unit, :user_id)
  end
end