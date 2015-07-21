class Game < ActiveRecord::Base
  belongs_to :user, class_name: "creator", foreign_key: :user_id
  has_many :enrollments
  has_many :players, through: :enrollments
end
