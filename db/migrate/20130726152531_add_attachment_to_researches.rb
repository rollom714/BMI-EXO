class AddAttachmentToResearches < ActiveRecord::Migration

 def self.up
	add_column :researches, :rAttachment_file_name, :string
	add_column :researches, :rAttachment_content_type, :string
	add_column :researches, :rAttachment_file_size, :integer
	add_column :researches, :rAttachment_updated_at, :datetime
  end
  
  def self.down
	remove_column :researches, :rAttachment_file_size
	remove_column :researches, :rAttachment_content_type
	remove_column :researches, :rAttachment_file_name
	remove_column :researches, :rAttachment_updated_at
  end
 
end
