class Author < ActiveRecord::Base
  authenticates_with_sorcery!
  attr_accessible :username, :password, :email, :password_confirmation
  validates_confirmation_of :password, message: "Should match confirmation", if: :password
  # attr_accessible :title, :body
end
