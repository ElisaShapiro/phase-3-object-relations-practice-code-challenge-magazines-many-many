class Reader < ActiveRecord::Base
    has_many :subscriptions
    has_many :magazines, through: :subscriptions

    def subscribe(magazine, price)
        new_subscription = Subscription.create(price: price, magazine_id: magazine.id, reader_id: self.id)
    end

    def total_subscription_price
        self.subscriptions.sum(&:price)
    end

    def cancel_subscription(magazine)
        cancelme = Subscription.find_by(magazine_id: magazine.id)
        cancelme.destroy
    end
end