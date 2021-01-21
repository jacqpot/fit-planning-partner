class Exercise < ApplicationRecord
    has_many :routines
    has_many :workouts, through: :routines

    # validates 

    scope :find_by_target_area, -> (muscle) { where("target_area LIKE ?", "%#{muscle}%")}
    scope :order_by_name, -> { order("lower(name) ASC") }
end
