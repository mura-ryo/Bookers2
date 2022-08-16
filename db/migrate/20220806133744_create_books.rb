class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      
      ## 本のタイトルを保存するカラム
      t.string :title
      ## 感想を保存するカラム
      t.text :body
      
      ## User IDを保存するカラム
      t.integer :user_id

      t.timestamps
    end
  end
end
