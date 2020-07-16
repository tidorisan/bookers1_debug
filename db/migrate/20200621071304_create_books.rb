class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.text :body
      t.timestamps
      #カラム名を追加する command で追加した
    end
  end
end
