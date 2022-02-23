class PokemonWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform
    PokemonService.new.call
  end
end
