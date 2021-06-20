class CreateSessions < ActiveRecord::Migration[6.1]
  def change
    create_table :sessions do |t|
      t.string :email
      t.string :accessToken
      t.datetime :expiresIn
      t.string :refreshToken

      t.timestamps
    end
  end
end
