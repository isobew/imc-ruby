class CreateImc < ActiveRecord::Migration[7.0]
  def change
    create_table :imc do |t|
      t.float :height
      t.integer :weight
      t.float :imc
      t.string :classification
      t.string :obesity

      t.timestamps
    end
  end
end
