require "test_helper"

class WeatherControllerTest < ActionDispatch::IntegrationTest
  test "should get 422 missing parameter city" do
    get weather_index_url
    assert_equal 422, status
  end

  test "should get error Unknown Location" do
    get weather_index_url, params:{city: "qa12321asdaa"}
    assert_equal 422, status
  end

  test "should get ok" do
    get weather_index_url, params:{city: "Rio de Janeiro"}
    assert_response :success
  end
end
