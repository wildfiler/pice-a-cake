class HomeController < ApplicationController
  def index
    @last_ten_receipts = Receipt.ordered.first(10)
  end
end
