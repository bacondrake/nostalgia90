class AddIndexToUsersEmail < ActiveRecord::Migration
  def change
    # Adds index to emails in order to more
    # easily look up a record (like a book's index)
    add_index :users, :email, unique: true
  end
end
