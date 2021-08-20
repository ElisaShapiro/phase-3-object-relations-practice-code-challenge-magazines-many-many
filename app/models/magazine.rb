class Magazine < ActiveRecord::Base
    has_many :subscriptions
    has_many :readers, through: :subscriptions

    def email_list
        self.readers.map {|reader| reader.email}.join(";")
    end
    
    def self.most_popular
        self.all.sort{|a, b| a.subscriptions.length <=> b.subscriptions.length}.reverse[0]
    end
end