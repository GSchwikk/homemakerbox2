namespace :scraper do
  desc "Fetch new builders"
  task csv_to_database: :environment do
	
	require 'csv'
	require 'open-uri'    

	
	CSV.foreach('C:\Sites\Scraped data\testdata.csv', :headers => true, encoding:'iso-8859-1:utf-8') do |row|
	  
	  listing_hash = {:name => row['name'], :description => row['description'], :address => row['address'], 
	  :image => URI.parse(row['image']), :phone => row['phone'], :category_id => row['category_id'], :website => row['website'] }
	  
	  Builder.create!(listing_hash)
	  #Builder.create!(row_to_hash)

	end

  end



  desc "TODO"
  task destroy_all_builders: :environment do
  end

end
