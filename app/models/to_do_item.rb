class ToDoItem < ApplicationRecord

  #belongs_to
  belongs_to :to_do_list

  validates :title, presence: true, length: { maximum: 120 }

end