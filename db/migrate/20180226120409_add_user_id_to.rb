class AddUserIdTo < ActiveRecord::Migration
  def change
    add_column :articles, :user_id, :interger
  end
end
