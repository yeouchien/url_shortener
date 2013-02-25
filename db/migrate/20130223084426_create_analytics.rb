class CreateAnalytics < ActiveRecord::Migration
  def change
    create_table :analytics do |t|
      t.string :clicks
      t.string :browsers
      t.string :platforms
      t.string :countries

      t.timestamps
    end
  end
end
