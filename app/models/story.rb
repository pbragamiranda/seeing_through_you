class Story < ApplicationRecord
	geocoded_by :location
	after_validation :geocode, if: :will_save_change_to_location?
	validates :plot, presence: true

	default_scope { where(active: true) }
end
