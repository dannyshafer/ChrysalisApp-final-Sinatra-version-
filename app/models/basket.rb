class Basket < ActiveRecord::Base
  belongs_to :user
  has_many :funds_baskets
end
