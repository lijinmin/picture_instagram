class CreatePictureTokens < ActiveRecord::Migration
  def change
    create_table :picture_tokens do |t|
      t.string :code
      t.string :access_token
      t.string :refresh_token

      t.timestamps null: false
    end
  end
end
