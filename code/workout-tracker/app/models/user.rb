class User < ActiveRecord::Base
    has_many :workouts
    has_secure_password
    validates :name, :username, :email, :age, :gender, presence: true
    validates :email, :username, uniqueness: true
    

end
