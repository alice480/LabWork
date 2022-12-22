class User < ApplicationRecord
  validates :login, presence: {message: "Login cant be empty"}, uniqueness: { message: "User with this login already exist"}
  validates :password, presence: {message: "Password cant be empty"}
end