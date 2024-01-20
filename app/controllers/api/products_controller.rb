module Api
  class ProductsController < ApplicationController
    before_action :authenticate_user, only: [:create, :index]

    def index
      @products = Product.all
      render json: normalize_json(@products)
    end

    def create
      @product = Product.new(product_params)
      if @product.save
        render json: normalize_json(@product), status: :created
      else
        render json: normalize_json("There was an error creating the product.", @product.errors), status: :unprocessable_entity
      end
    end

    private

    def product_params
      params.require(:product).permit(:name)
    end
  end
end
