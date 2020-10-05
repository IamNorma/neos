require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require_relative 'near_earth_objects'

class NearEarthObjectsTest < Minitest::Test
  def test_it_exists
    results = NearEarthObjects.new('2019-03-30')
    assert_instance_of NearEarthObjects, results
  end

  def test_returns_largest_asteroid_diameter
    results = NearEarthObjects.new('2019-03-30')
    assert_equal 10233, results.largest_astroid_diameter
  end

  def test_it_returns_total_number_of_astroids
    results = NearEarthObjects.new('2019-03-30')
    assert_equal 12, results.total_number_of_astroids
  end

  def test_it_returns_formatted_asteroid_data
    results = NearEarthObjects.new('2019-03-30')
    expected = {
                name: '(2019 GD4)',
                diameter: '61 ft',
                miss_distance: '911947 miles'
                }
    assert_equal expected, results.formatted_asteroid_data[0]
  end
end
