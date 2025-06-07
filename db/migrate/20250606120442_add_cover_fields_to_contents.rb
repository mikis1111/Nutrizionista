class AddCoverFieldsToContents < ActiveRecord::Migration[7.1]
  def change
    add_column :contents, :cover_file_name, :string
    add_column :contents, :cover_content_type, :string
    add_column :contents, :cover_file_size, :integer
    add_column :contents, :cover_updated_at, :datetime
  end
end
