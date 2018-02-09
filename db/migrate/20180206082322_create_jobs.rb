class CreateJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :description
      t.string :image_url
      t.decimal :salary, precision: 9, scale: 2

      t.timestamps
    end
  end
end
