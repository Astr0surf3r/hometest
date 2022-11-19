class CreateAttachments < ActiveRecord::Migration[6.1]
  def change
    create_table :attachments do |t|
      t.string :title
      t.references :user, null: false, foreign_key: true
      t.integer :type_doc

      t.timestamps
    end
  end
end
