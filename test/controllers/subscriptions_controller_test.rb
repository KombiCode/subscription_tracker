require "test_helper"

class SubscriptionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @subscription = subscriptions(:one)
  end

  test "should get index" do
    get subscriptions_url
    assert_response :success
  end

  test "should get new" do
    get new_subscription_url
    assert_response :success
  end

  test "should create subscription" do
    assert_difference("Subscription.count") do
      post subscriptions_url, params: { subscription: { account_email: @subscription.account_email, billing_cycle: @subscription.billing_cycle, category_id: @subscription.category_id, credentials_location: @subscription.credentials_location, currency: @subscription.currency, mfa_enabled: @subscription.mfa_enabled, mfa_method: @subscription.mfa_method, monthly_cost: @subscription.monthly_cost, name: @subscription.name, next_renewal_on: @subscription.next_renewal_on, notes: @subscription.notes, provider_id: @subscription.provider_id, purpose: @subscription.purpose } }
    end

    assert_redirected_to subscription_url(Subscription.last)
  end

  test "should show subscription" do
    get subscription_url(@subscription)
    assert_response :success
  end

  test "should get edit" do
    get edit_subscription_url(@subscription)
    assert_response :success
  end

  test "should update subscription" do
    patch subscription_url(@subscription), params: { subscription: { account_email: @subscription.account_email, billing_cycle: @subscription.billing_cycle, category_id: @subscription.category_id, credentials_location: @subscription.credentials_location, currency: @subscription.currency, mfa_enabled: @subscription.mfa_enabled, mfa_method: @subscription.mfa_method, monthly_cost: @subscription.monthly_cost, name: @subscription.name, next_renewal_on: @subscription.next_renewal_on, notes: @subscription.notes, provider_id: @subscription.provider_id, purpose: @subscription.purpose } }
    assert_redirected_to subscription_url(@subscription)
  end

  test "should destroy subscription" do
    assert_difference("Subscription.count", -1) do
      delete subscription_url(@subscription)
    end

    assert_redirected_to subscriptions_url
  end
end
