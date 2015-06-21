class AddPasswordDigestToUsers < ActiveRecord::Migration
  def change
    # add password digest so user passwords can be hashed
    add_column :users, :password_digest, :string
  end
end
