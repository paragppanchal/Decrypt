namespace :fetch_market_snapshot do
  desc "Fetch all exchanges buy sell price"
  task fetch_all: :environment do

    puts 'Fetching buy & sell prices of all the exchanges...'
    puts '--------------------------------------------------'

    FetchMarketSnapshotJob.perform_now

  end

end
