class User < ApplicationRecord
  has_secure_password
  # Provides user authentication features on the model
  # it's called in. Requires a column named `password_digest`
  # and the gem `bcrypt`

  # - It will add two attribute accessors for `password`
  #   and `password_confirmation`
  # - It will add a presence validation for the `password`
  #   field.
  # - It will save passwords assigned to `.password`
  #   using bcrypt to hash and store it in the
  #   the `password_digest` column meaning that we'll
  #   never store plain text passwords.
  # - It will add a method named `authenticate` to verify
  #   a user's pasword. If called with the correct password,
  #   it will return the user. Otherwise, it will return `false`
  # - The attr accesssor `password_confirmation` is optional.
  #   If it is present, a validation will verify that it is
  #   identical to the `password` accessor.

  has_many :questions, dependent: :nullify
  has_many :answers, dependent: :nullify

  validates :first_name, :last_name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  #                   |          |@|
  #                   | steve    |@|codecore|.com
  #           INVALID | jim%bob  |a|b*zz    |,gov

  # The following validation will check that the email is present,
  # it's unique and it respects a certain format. To test the format,
  # we use a regular express. Regular expression often abbreviated
  # as Regex or Regexp is sort mini-programming for detecting patterns
  # in text. To learn more, check out https://regexone.com/

  validates(
    :email,
    presence: true,
    uniqueness: true,
    format: VALID_EMAIL_REGEX
  )

  def full_name
    first_name + " " + last_name
  end
end