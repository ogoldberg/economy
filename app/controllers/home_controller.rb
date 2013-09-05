class HomeController < ApplicationController
  def index
    @transactions = (current_user.sent_transactions + current_user.received_transactions).sort_by(&:created_at)
  end
end
