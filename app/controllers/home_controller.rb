class HomeController < ApplicationController
  def index
    @last_ten_receipts = Receipt.includes(components: :ingredient).last_ten
  end
end
