class DashboardController < ApplicationController
  def index
    @subscriptions = Subscription.includes(:provider, :category).order(:next_renewal_on)
    @total_monthly = Subscription.sum(:monthly_cost)
    @renewing_soon = Subscription.where(next_renewal_on: ..30.days.from_now)
    @by_category = Subscription.joins(:category).group("categories.name").sum(:monthly_cost)
  end
end