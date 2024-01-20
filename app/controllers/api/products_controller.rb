class Api::ProductsController < ApplicationController
  before_action :authenticate_user

  def index
    @products = Product.all
    render json: normalize_json(@products)
  end

  def create
    product = Product.new(product_params)
    if product.valid?
      ProductCreationWorker.perform_async(product_params.as_json)
      render json: normalize_json({ message: 'Product creation enqueued successfully.' }), status: :accepted
    else
      render json: normalize_json({ message: 'There was an error creating the product.'}, { error: product.errors }), status: :unprocessable_entity
    end
  end

  private

  def product_params
    params.require(:product).permit(:name)
  end
end
