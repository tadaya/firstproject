class CreateTaggings < ActiveRecord::Migration
  def change
    create_table :taggings do |t|
      t.references :user
      t.references :place
      t.references :tag
    end
  end
end
