class Costumer < ActiveRecord::Base
    has_many :purchases
    validates_presence_of :name
end