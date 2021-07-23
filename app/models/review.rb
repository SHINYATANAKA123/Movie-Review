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

  def self.good_ranks
    Review.find(Good.group(:review_id).order('count(review_id) desc').limit(3).pluck(:review_id))
  end

  def self.bad_ranks
    Review.find(Bad.group(:review_id).order('count(review_id) desc').limit(3).pluck(:review_id))
  end

  def self.count_ranks
    Review.group(:movie_id, :title, :poster_path).select('reviews.movie_id, reviews.title, reviews.poster_path, count(movie_id) as review_count').order('review_count desc').limit(6)
  end

end
