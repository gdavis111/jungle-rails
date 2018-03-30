class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]

    # MAKE SURE THIS IS CORRECT
    @review = Review.new
    ###########################
  end

end
