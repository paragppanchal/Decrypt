namespace :fetch_market_snapshot do
  desc "Fetch all exchanges buy sell price"
  task fetch_all: :environment do

    puts 'Fetching all the exchanges buy sell prices...'

    FetchMarketSnapshotJob.perform_now

  end

end
