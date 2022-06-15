class EmailActivation < ApplicationRecord
  belongs_to :user
  validates :user_id, uniqueness: true

  def varificated
    update_attribute(:is_activated, true)
  end
  def verificated?
    is_activated.true?    
  end
end
