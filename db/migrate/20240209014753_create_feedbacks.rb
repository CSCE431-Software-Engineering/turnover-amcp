class CreateFeedbacks < ActiveRecord::Migration[7.0]
  def change
    create_table :feedbacks do |t|
      t.string :feedback
      t.string :email
      t.string :name

      t.timestamps
    end
  end
end
