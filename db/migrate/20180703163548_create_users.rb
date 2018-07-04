class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email, index: {unique: true}
      # And index is a seperate data structure
      # that is maintained. That improves the performance
      # of doing queries on the indexed column (up
      # to O(log n) performance) like binary search.

      # Add an index to columns that will be searched
      # very often such users by their email. This
      # will happen everytime a user logs in or we need
      # to find that user.
      t.string :password_digest

      t.timestamps
    end
  end
end