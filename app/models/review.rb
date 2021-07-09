class Review < ApplicationRecord
  belongs_to :user
  has_many :goods
  has_many :bads

  validates :total_score, presence: true

  validates :body, length: { maximum: 2000 }

   # goodsの中に、引数で渡されたuserのidを持つレコードがあるかの判定をする
  def good_by?(user)
    goods.where(user_id: user.id).present? # exists?の方がいいかも
  end

  # badsの中に、引数で渡されたuserのidを持つレコードがあるかの判定をする
  def bad_by?(user)
    bads.where(user_id: user.id).present? # exists?の方がいいかも
  end

end
