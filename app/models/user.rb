class User < ActiveRecord::Base
  has_many :created_games, class_name: "Game"
  
  has_many :enrollments
  has_many :enrolled_games, through: :enrollments, source: :game
end
