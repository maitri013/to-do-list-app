class CreateUserAndTodolistTables < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.string :name
      t.string :mobile_number
      t.boolean :signed_up, default: false

      t.timestamps
    end

    create_table :to_do_lists do |t|
      t.integer :user_id, index: true
      t.string :title
      t.string :description

      t.timestamps
    end

    create_table :to_do_items do |t|
      t.integer :to_do_list_id, index: true
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
