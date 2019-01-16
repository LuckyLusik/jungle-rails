class Admin::CategoriesController < ApplicationController
  def index
    @category = Category.order(name: :desc).all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(product_params)

    if @category.save
      redirect_to [:admin, :categories], notice: 'Categiry created!'
    else
      render :new
    end
  end

  private

  def product_params
    params.require(:category).permit(
      :name
    )
  end

end
