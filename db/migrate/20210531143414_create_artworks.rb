class CreateArtworks < ActiveRecord::Migration[6.0]
  def change
    create_table :artworks do |t|
      t.string :title
      t.text :description
      t.text :request
      t.boolean :privacy, default: true
      t.integer :version
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
