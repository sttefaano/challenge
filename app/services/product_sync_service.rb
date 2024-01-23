class ProductSyncService

  def self.sync_with_api
    api_products = fetch_api_products['data']

    api_products.each do |product|
      product = Product.new(name: product['name'])
      product.save
    end
  end

  private

  def self.fetch_api_products
    response = RestClient.post(
      'https://23f0013223494503b54c61e8bee1190c.api.mockbin.io/',
      {},
      { content_type: :json, accept: :json }
    )

    JSON.parse(response.body)
  end
end
