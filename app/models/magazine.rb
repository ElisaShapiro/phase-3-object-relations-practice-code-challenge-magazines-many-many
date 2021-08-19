class Magazine < ActiveRecord::Base
    has_many :subscriptions
end