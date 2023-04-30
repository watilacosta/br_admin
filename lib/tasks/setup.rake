require 'csv'

namespace :setup do
  desc "Save list of airports into database"
  task airports: :environment do
    if File.exist?(Rails.root.join('db', 'airports.csv'))
      CSV.foreach(Rails.root.join('db', 'airports.csv'), headers: true) do |row|
        Airport.create!(row.to_hash)
        puts Airport.last.icao
      end
    else
      puts "File db/airports.csv does not exist"
    end
  end

end
