require 'parser'
require 'summary'
require 'statistic'
require 'yaml'

describe Statistic do

  before do
    @yaml = YAML.load_file("./fixtures/statistic.yml")
    parser = Parser.new(:file_in => "./fixtures/test_data.csv")
    summary = Summary.new(:data => parser.parser_data)
    @statistics = Statistic.new(:results => summary.group_data)
  end

  it "Highest Impressions" do
    highest_value = @statistics.highest_impressions
    expect(highest_value[:impressions]).to eql(@yaml["highest_impressions"])
  end

  it "Highest Clicks" do
    highest_value = @statistics.highest_clicks
    expect(highest_value[:clicks]).to eql(@yaml["highest_clicks"])
  end

  it "Highest Converted Clicks " do
    highest_value = @statistics.highest_converted_clicks
    expect(highest_value[:converted_clicks]).to eql(@yaml["highest_converted_clicks"])
  end

  it "Lowest Cost " do
    lowest_value = @statistics.lowest_cost
    expect(lowest_value[:cost]).to eql(@yaml["lowest_cost"])
  end

  it "Highest Conv. Clicks/Clicks" do
    highest_value = @statistics.highest_converted_clicks_div_clicks
    expect(highest_value[:converted_clicks_div_clicks]).to eql(@yaml["highest_converted_clicks_div_clicks"])
  end

  it "Lowest Cost / Converted Click" do
    lowest_value = @statistics.lowest_cost_div_converted_click
    expect(lowest_value[:cost_div_converted_click]).to eql(@yaml["lowest_cost_div_converted_click"])
  end

end