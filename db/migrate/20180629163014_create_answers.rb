class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.text :body
      t.references :question, foreign_key: true

      # Command to create me:
      # `rails g model answer body:text question:references`

      # The above creates a `question_id` column of type
      # `big_int`. It also sets a foreign_key constraint to
      # enforce the association to the questions tables at
      # the database level. The `question_id` will refer
      # to the id of question in the questions table.
      # It is said that the answer "belongs to" the question.

      # Big Int can go from -9_223_372_036_854_775_807
      # to 9223372036854775807.

      # Int can go from -2_147_483_648 to 2147483648

      t.timestamps
    end
  end
end