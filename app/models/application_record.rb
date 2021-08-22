class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def interest_by?(user)
    interests.where(user_id: user.id).present? # exists?の方がいいかも
  end
end
