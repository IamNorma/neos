require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require_relative 'near_earth_objects'

class NearEarthObjectsTest < Minitest::Test
  def test_it_can_create_connection
    assert_equal Faraday::Connection, NearEarthObjects.create_connection('2019-03-30').class
  end

  def test_it_can_get_asteroids_list_data
    assert_equal Faraday::Response, NearEarthObjects.asteroids_list_data('2019-03-30').class
  end

  def test_it_can_parse_asteroids_data
    assert_equal Array, NearEarthObjects.parsed_asteroids_data('2019-03-30').class
  end

  def test_it_can_find_largest_astroid_diameter
    assert_equal Integer, NearEarthObjects.largest_astroid_diameter('2019-03-30').class
    assert_equal 10233, NearEarthObjects.largest_astroid_diameter('2019-03-30')
  end

  def test_it_can_find_total_number_of_asteroids
    assert_equal 12, NearEarthObjects.total_number_of_astroids('2019-03-30')
  end

  def test_it_can_format_asteroid_data
    assert_equal Array, NearEarthObjects.formatted_asteroid_data('2019-03-30').class
    assert_equal ({:name=>"(2019 GD4)", :diameter=>"61 ft", :miss_distance=>"911947 miles"}), NearEarthObjects.formatted_asteroid_data('2019-03-30').first
    assert_equal ({:name=>"(2019 UZ)", :diameter=>"51 ft", :miss_distance=>"37755577 miles"}), NearEarthObjects.formatted_asteroid_data('2019-03-30').last
  end

  def test_a_date_returns_a_list_of_neos
    results = NearEarthObjects.find_neos_by_date('2019-03-30')
    assert_equal '(2019 GD4)', results[:astroid_list][0][:name]
  end
end
