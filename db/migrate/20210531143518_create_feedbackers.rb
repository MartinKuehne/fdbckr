class CreateFeedbackers < ActiveRecord::Migration[6.0]
  def change
    create_table :feedbackers do |t|
      t.references :user, null: false, foreign_key: true
      t.references :artwork, null: false, foreign_key: true

      t.timestamps
    end
  end
end
