class AddCoordinatesToStories < ActiveRecord::Migration[6.1]
  def change
    add_column :stories, :latitude, :float
    add_column :stories, :longitude, :float
  end
end
