require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require_relative 'format_data'
require_relative 'near_earth_objects'

class FormatDataTest < Minitest::Test
  def test_it_exists
    results = NearEarthObjects.new('2019-03-30').formatted_asteroid_data
    table = FormatData.new(results)

    assert_instance_of FormatData, table
  end

  def test_it_can_return_column_data
    results = NearEarthObjects.new('2019-03-30').formatted_asteroid_data
    table = FormatData.new(results)

    expected = {:name=>{:label=>"Name", :width=>17},
              :diameter=>{:label=>"Diameter",
              :width=>8},
              :miss_distance=>{:label=>"Missed The Earth By:", :width=>20}}
    assert_equal expected, table.column_data
  end

  def test_it_returns_header
    results = NearEarthObjects.new('2019-03-30').formatted_asteroid_data
    table = FormatData.new(results)

    expected = "+-------------------+----------+----------------------+"
    assert_equal expected, table.divider
  end

  def test_it_can_create_rows
    results = NearEarthObjects.new('2019-03-30').formatted_asteroid_data
    table = FormatData.new(results)

    expected = [{:name=>"(2019 GD4)", :diameter=>"61 ft", :miss_distance=>"911947 miles"},
      {:name=>"(2019 GN1)", :diameter=>"147 ft", :miss_distance=>"9626470 miles"},
      {:name=>"(2019 GN3)", :diameter=>"537 ft", :miss_distance=>"35277204 miles"},
      {:name=>"(2019 GB)", :diameter=>"81 ft", :miss_distance=>"553908 miles"},
      {:name=>"(2019 FQ2)", :diameter=>"70 ft", :miss_distance=>"2788140 miles"},
      {:name=>"(2011 GE3)", :diameter=>"123 ft", :miss_distance=>"35542652 miles"},
      {:name=>"(2019 FT)", :diameter=>"512 ft", :miss_distance=>"5503325 miles"},
      {:name=>"(2019 FS1)", :diameter=>"134 ft", :miss_distance=>"6241521 miles"},
      {:name=>"141484 (2002 DB4)", :diameter=>"10233 ft", :miss_distance=>"37046029 miles"},
      {:name=>"(2011 GK44)", :diameter=>"147 ft", :miss_distance=>"10701438 miles"},
      {:name=>"(2012 QH8)", :diameter=>"1071 ft", :miss_distance=>"37428269 miles"},
      {:name=>"(2019 UZ)", :diameter=>"51 ft", :miss_distance=>"37755577 miles"}]

    assert_equal expected, table.create_rows
  end
end
