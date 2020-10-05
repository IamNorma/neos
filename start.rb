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
# astroid_details = NearEarthObjects.new(date)
# astroid_list = astroid_details[:astroid_list]
# total_number_of_astroids = astroid_details[:total_number_of_astroids]
# largest_astroid = astroid_details[:biggest_astroid]

# column_labels = { name: "Name", diameter: "Diameter", miss_distance: "Missed The Earth By:" }
# column_data = column_labels.each_with_object({}) do |(col, label), hash|
#   hash[col] = {
#     label: label,
#     width: [astroid_list.map { |astroid| astroid[col].size }.max, label.size].max}
# end

# header = "| #{ column_data.map { |_,col| col[:label].ljust(col[:width]) }.join(' | ') } |"
# divider = "+-#{column_data.map { |_,col| "-"*col[:width] }.join('-+-') }-+"

# def format_row_data(row_data, column_info)
#   row = row_data.keys.map { |key| row_data[key].ljust(column_info[key][:width]) }.join(' | ')
#   puts "| #{row} |"
# end
#
# def create_rows(astroid_data, column_info)
#   rows = astroid_data.each { |astroid| format_row_data(astroid, column_info) }
# end

puts "______________________________________________________________________________"
puts "On #{formated_date}, there were #{neos.total_number_of_astroids} objects that almost collided with the earth."
puts "The largest of these was #{neos.largest_astroid_diameter} ft. in diameter."
puts "\nHere is a list of objects with details:"
puts astroid_data.divider
puts astroid_data.header
astroid_data.create_rows
puts astroid_data.divider
