class CreateTranslationForCategories < ActiveRecord::Migration
  def up
    Category.create_translation_table!(
      { name: :string }
      { migrate_data: true}
    )
  end
  
  def down
    Category.drop_translation_table! migrate_data: true
  end
end
