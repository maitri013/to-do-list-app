class User < ApplicationRecord

  has_secure_password

  has_many :to_do_lists
  has_many :to_do_items, through: :to_do_lists

  validates :email, :uniqueness => {:case_sensitive => false}
  validates :name, presence: true
  validates :password, length: { minimum: 6 }, on: :create

end
