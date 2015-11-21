class User < ActiveRecord::Base
	include Monitored
    validates :email, presence: true, uniqueness: true
end
