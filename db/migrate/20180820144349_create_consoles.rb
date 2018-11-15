class CreateConsoles < ActiveRecord::Migration[5.2]
  def change
    create_table :consoles do |t|
      t.string :name
      t.string :company
      t.integer :year_released

      t.timestamps
    end
  end
end
