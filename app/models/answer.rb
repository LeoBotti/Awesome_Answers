class Answer < ApplicationRecord
  belongs_to :user

  # The model with the `belongs_to` method
  # is ALWAYS the model that has the foreign
  # column (i.e. question_id).

  # Rails guide on Associations
  # http://guides.rubyonrails.org/association_basics.html

  # By default, `belongs_to` will create a validation
  # such as `validates :question_id, presence: true`.
  # It can be disabled by passing the option
  # `optional: true` to the `belongs_to` method.
  belongs_to :question #, optional: true

  # The following are instance methods that are
  # added to this class by `belongs_to :question`
  # method call above:

  # question
  # question=(associate)
  # build_question(attributes = {})
  # create_question(attributes = {})
  # create_question!(attributes = {})
  # reload_question
  validates :body, presence: true
end