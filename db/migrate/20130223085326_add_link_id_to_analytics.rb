class AddLinkIdToAnalytics < ActiveRecord::Migration
  def change
    add_column :analytics, :link_id, :integer
  end
end
