class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.text :long_url
      t.string :short_url
      t.integer :http_status, :default => 301

      t.timestamps
    end
  end
end
