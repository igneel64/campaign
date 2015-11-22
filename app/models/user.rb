class User < ActiveRecord::Base
	include Monitored
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, uniqueness: true,format: {with: VALID_EMAIL_REGEX}
end
