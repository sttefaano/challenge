class ProductCreationWorker
  include Sidekiq::Worker

  def perform(product_params)
    Product.create!(product_params)
  end
end
