class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :books, :published, :publisher
  end
end
