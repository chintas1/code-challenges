require 'csv'
require 'pry'
require 'rubygems'
require 'open-uri'
require 'net/http'
load 'user.rb'

# Main runner method. Runs all the methods writte.
def run
  users = load_users('data/mockdata.csv')
  print_country_counts(users_per_country(users))
  print 'Company with most users: '
  puts company_w_most_users(users).join(' with ') + ' users.'
  puts
  users.first.greet
  puts "My geolocated country by IP is #{get_geolocation(users.first)}."
end

#Reads in data from csv, converts into an array of users, and returns array
def load_users(csv_path)
  csv = CSV.read('data/mockdata.csv')
  columns = csv.shift
  csv.map do |user_data|
    User.new(columns[0].to_sym => user_data[0].to_i, 
             columns[1].to_sym => user_data[1], 
             columns[2].to_sym => user_data[2], 
             columns[3].to_sym => user_data[3], 
             columns[4].to_sym => user_data[4], 
             columns[5].to_sym => user_data[5])
  end
end

#Takes in a hash {country: count} and prints it to console in a clean format
def print_country_counts(counts_hash)
  puts 'Countries ordered by number of users from country:'
  counts_hash.sort_by {|country, count| count*-1}.each do |country, count|
    puts "#{country}: #{count}"
  end
  puts ''
end

#Takes in an array of users and returns an array containing the company with
#the most users and the number of users for that company
def company_w_most_users(users)
  company_count = Hash.new(0)
  users.each do |user|
    company_count[user.email.split('@').last.split('.').first.capitalize] += 1
  end
  company_count.sort_by {|company, count| count*-1}.first
end

#Takes in an array of users and returns a hash of form {country: user_count}
#where user_count is the number of users from that country
def users_per_country(users)
  country_count = Hash.new(0)
  users.each do |user|
    country_count[user.country] += 1;
  end
  country_count
end

#Takes in a user and returns the country associated with their ip address
def get_geolocation(user)
  api_key = '3a351e2b706f80228b633eb436bd4a4df99ab4abd2b1f732db4ca796a7a554dc'
  query_string = URI.parse("http://api.ipinfodb.com/v3/ip-country/?key=#{api_key}&ip=#{user.ip_address}")
  req = Net::HTTP::Get.new(query_string.to_s)
  user_country = Net::HTTP.get_response(query_string).body.split(';').last
end

run