class User < ApplicationRecord
  mount_uploader :image_id, ImageUploader

  validates :name, uniqueness: :true, length: { maximum: 20 }

  enum sex: { '--': 0, 男性: 1, 女性: 2, その他: 9 }

  has_many :goods, dependent: :destroy
  has_many :bads, dependent: :destroy

  has_many :reviews, dependent: :destroy
  has_many :good_reviews, through: :goods, source: :review # has_many a, through: :b で、bを通したuser.aが使える。aをreviewsにするとhas_many :reviewsと被ってしまう為、sourceにモデル名を書いた上でaの名前を変えている
  has_many :bad_reviews, through: :bads, source: :review # has_many a, through: :b で、bを通したuser.aが使える。aをreviewsにするとhas_many :reviewsと被ってしまう為、sourceにモデル名を書いた上でaの名前を変えている

  has_many :interests, dependent: :destroy

  has_many :active_relationships, class_name: 'Relationship', foreign_key: :following_id # 外部キーをfollowing_idとしているので、フォローする側から見たRelasionships
  has_many :followings, through: :active_relationships, source: :follower

  has_many :passive_relationships, class_name: 'Relationship', foreign_key: :follower_id # 外部キーをfollower_idとしているので、フォローされる側から見たRelasionships
  has_many :followers, through: :passive_relationships, source: :following

  attachment :image

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook twitter google_oauth2]

  def self.form_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.name = auth.info.name
      user.password = Devise.friendly_token[0,20]
    end
  end

  def followed_by?(user)
    passive_relationships.where(following_id: user.id).exists? #exists?の方がいいかも
  end

  def timeline
    Review.where("user_id IN (?)", following_ids)
  end

  def self.follower_ranks
    User.find(Relationship.group(:follower_id).order('count(follower_id) desc').limit(5).pluck(:follower_id))
  end
ENV['HOST']

end
