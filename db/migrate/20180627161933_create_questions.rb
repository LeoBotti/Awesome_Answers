class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    # knex.createTable("questions", t => {
      # t.string("title")
    # })
    create_table :questions do |t|
      # Not shown here an "id" primary key column
      # is always generated.
      t.string :title
      # Creates a column of type VARCHAR(255) with
      # the name "title"
      t.text :body
      # Create a column of type TEXT with the name
      # "body"
      t.timestamps
      # Create two columns, created_at and updated_at,
      # which are auto-updated.
    end
  end
end
