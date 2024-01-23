class ProductSyncWorker
  include Sidekiq::Worker
  queue_as :default

  def perform
    ProductSyncService.sync_with_api
  end
end
