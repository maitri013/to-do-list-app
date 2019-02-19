class User < ApplicationRecord

  has_many :to_do_lists
  has_many :to_do_items, through: :to_do_lists
end