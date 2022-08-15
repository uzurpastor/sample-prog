class Post < ApplicationRecord
  #===== dependencies ======#
  belongs_to :user

  #====== validations ======#
  validates_presence_of :user_id
  validates_length_of :content,
    maximum: 255,
    minimum: 5

  #===== scopes ============#
  default_scope -> { order(created_at: :desc) }
end
