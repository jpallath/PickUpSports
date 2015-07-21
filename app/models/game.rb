class Game < ActiveRecord::Base
  belongs_to :creator, class_name: "User", foreign_key: :user_id

  has_many :enrollments
  has_many :players, through: :enrollments
end
