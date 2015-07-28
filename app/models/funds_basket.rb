class FundsBasket < ActiveRecord::Base
  belongs_to :fund
  belongs_to :basket
end
