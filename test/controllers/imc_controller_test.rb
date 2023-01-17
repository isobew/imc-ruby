require "test_helper"

class ImcControllerTest < ActionDispatch::IntegrationTest
  setup do
    @imc = imc(:one)
  end

  test "should get index" do
    get imc_index_url, as: :json
    assert_response :success
  end

  test "should create imc" do
    assert_difference("Imc.count") do
      post imc_index_url, params: { imc: { classification: @imc.classification, height: @imc.height, imc: @imc.imc, obesity: @imc.obesity, weight: @imc.weight } }, as: :json
    end

    assert_response :created
  end

  test "should show imc" do
    get imc_url(@imc), as: :json
    assert_response :success
  end

  test "should update imc" do
    patch imc_url(@imc), params: { imc: { classification: @imc.classification, height: @imc.height, imc: @imc.imc, obesity: @imc.obesity, weight: @imc.weight } }, as: :json
    assert_response :success
  end

  test "should destroy imc" do
    assert_difference("Imc.count", -1) do
      delete imc_url(@imc), as: :json
    end

    assert_response :no_content
  end
end
