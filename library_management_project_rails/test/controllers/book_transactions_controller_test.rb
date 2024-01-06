require "test_helper"

class BookTransactionsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get book_transactions_create_url
    assert_response :success
  end

  test "should get update" do
    get book_transactions_update_url
    assert_response :success
  end

  test "should get index" do
    get book_transactions_index_url
    assert_response :success
  end
end
