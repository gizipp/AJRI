class RemoveNameFromAttachments < ActiveRecord::Migration[5.2]
  def change
    remove_column :attachments, :name, :datatype
  end
end
