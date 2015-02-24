class Season < ActiveRecord::Base
  belongs_to :league
  has_many :players, class_name: User
end
