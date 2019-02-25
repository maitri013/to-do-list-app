class ToDoList < ApplicationRecord

  #has_many
  has_many :to_do_items, dependent: :destroy

  #belongs_to
  belongs_to :user

  validates :title, presence: true, length: { maximum: 120 }
  validates :description, length: { maximum: 160 }

end