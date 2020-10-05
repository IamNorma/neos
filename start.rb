require_relative 'near_earth_objects'
require_relative 'format_data'

puts "________________________________________________________________________________________________________________________________"
puts "Welcome to NEO. Here you will find information about how many meteors, astroids, comets pass by the earth every day. \nEnter a date below to get a list of the objects that have passed by the earth on that day."
puts "Please enter a date in the following format YYYY-MM-DD."
print ">>"

date = gets.chomp
neos = NearEarthObjects.new(date)
astroid_data = FormatData.new(neos.formatted_asteroid_data)
formated_date = DateTime.parse(date).strftime("%A %b %d, %Y")

puts "______________________________________________________________________________"
puts "On #{formated_date}, there were #{neos.total_number_of_astroids} objects that almost collided with the earth."
puts "The largest of these was #{neos.largest_astroid_diameter} ft. in diameter."
puts "\nHere is a list of objects with details:"
puts astroid_data.divider
puts astroid_data.header
astroid_data.create_rows
puts astroid_data.divider
