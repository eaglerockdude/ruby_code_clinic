#!/usr/bin/env ruby

require_relative('functions')
puts "\n*** LAKE PEND OREILLE READINGS"
puts "Calculates the mean and median of the wind speed,"
puts "air temperature, and barometric pressure recorded at Deep Moore Station"
puts "Calculates the mean and median of the wind speed,"

# get our start and end dates (as array [] are optional)
start_date, end_date = query_user_for_date_range

puts start_date.strftime('%B %d,%Y')
puts end_date.strftime('%B %d,%Y')




