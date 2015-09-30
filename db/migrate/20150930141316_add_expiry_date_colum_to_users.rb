class AddExpiryDateColumToUsers < ActiveRecord::Migration
  def change
    add_column :users, :expire_token, :datetime    
  end
end
