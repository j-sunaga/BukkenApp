require 'test_helper'

class BukkensControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bukken = bukkens(:one)
  end

  test "should get index" do
    get bukkens_url
    assert_response :success
  end

  test "should get new" do
    get new_bukken_url
    assert_response :success
  end

  test "should create bukken" do
    assert_difference('Bukken.count') do
      post bukkens_url, params: { bukken: { address: @bukken.address, name: @bukken.name, note: @bukken.note, price: @bukken.price, year: @bukken.year } }
    end

    assert_redirected_to bukken_url(Bukken.last)
  end

  test "should show bukken" do
    get bukken_url(@bukken)
    assert_response :success
  end

  test "should get edit" do
    get edit_bukken_url(@bukken)
    assert_response :success
  end

  test "should update bukken" do
    patch bukken_url(@bukken), params: { bukken: { address: @bukken.address, name: @bukken.name, note: @bukken.note, price: @bukken.price, year: @bukken.year } }
    assert_redirected_to bukken_url(@bukken)
  end

  test "should destroy bukken" do
    assert_difference('Bukken.count', -1) do
      delete bukken_url(@bukken)
    end

    assert_redirected_to bukkens_url
  end
end
