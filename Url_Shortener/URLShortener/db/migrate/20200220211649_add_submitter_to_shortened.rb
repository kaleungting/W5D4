class AddSubmitterToShortened < ActiveRecord::Migration[5.2]
  def change
    add_column(:shortened_urls,:submitter_id, :integer,null:false)
  end
end
