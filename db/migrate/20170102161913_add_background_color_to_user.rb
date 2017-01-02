class AddBackgroundColorToUser < ActiveRecord::Migration
  def change
    add_column :users, :background_color, :string, :default => "#73d6d0"
  end
end
