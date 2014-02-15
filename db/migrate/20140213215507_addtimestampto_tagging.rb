class AddtimestamptoTagging < ActiveRecord::Migration
  def change
    change_table(:taggings) do |t|
      t.timestamp(:timestamp)
    end
  end
end
