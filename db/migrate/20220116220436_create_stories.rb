class CreateStories < ActiveRecord::Migration[6.1]
  def change
    create_table :stories do |t|
      t.string :plot
      t.string :when
      t.string :location
      t.boolean :active

      t.timestamps
    end
  end
end
