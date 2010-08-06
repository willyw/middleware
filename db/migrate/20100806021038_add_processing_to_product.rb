class AddProcessingToProduct < ActiveRecord::Migration
  def self.up
    add_column :products, :processing, :boolean, :default => true
  end

  def self.down
  end
end
