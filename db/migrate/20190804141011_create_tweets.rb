class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|
      t.string :body, null: false, default: '', limit: 140 

      t.timestamps
    end
  end
end
