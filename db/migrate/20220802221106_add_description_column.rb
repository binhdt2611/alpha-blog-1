class AddDescriptionColumn < ActiveRecord::Migration[6.1]
  def change
    # Formula: method :table_name, :attribute, :data_type
    add_column :articles, :description, :text
  end
end
