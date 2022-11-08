class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      # カラムの追加　本のタイトル(title)と感想(body)
      t.string :title
      t.string :body
      t.timestamps
    end
  end
end
