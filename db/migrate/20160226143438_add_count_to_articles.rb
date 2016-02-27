class AddCountToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :count, :integer,:default => 0
  end
end
