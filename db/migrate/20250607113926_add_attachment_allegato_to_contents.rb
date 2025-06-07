class AddAttachmentAllegatoToContents < ActiveRecord::Migration[7.1]
  def change
    add_column :contents, :allegato_file_name,    :string
    add_column :contents, :allegato_content_type, :string
    add_column :contents, :allegato_file_size,    :integer
    add_column :contents, :allegato_updated_at,   :datetime
  end
end


 

