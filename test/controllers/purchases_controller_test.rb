require 'test_helper'

class PurchasesControllerTest < ActionController::TestCase

    setup do
        @purchases = purchases(:first)
    end
    

    test "should get index" do
        get :index
        assert_equal "index", @controller.action_name
        assert_response(:success)
        assert_not_empty assigns(:purchases)
        assert_match "Purchases", @response.body
    end

    test "should create an purchase" do
        upload = fixture_file_upload('test.txt', 'text/plain')
            assert_difference('Purchase.count') do
                post :create, purchase: { process_file: upload }
            end

        assert_response(:redirect)
    end

    test "should destroy an purchase" do
        assert_difference('Purchase.count', -1) do
            delete :destroy, id: @purchases
        end

        assert_response(:redirect)
    end  

end