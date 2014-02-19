class ChangeTagsName < ActiveRecord::Migration
  def change
    rename_column :tags, :tags, :tag_word
  end
end
