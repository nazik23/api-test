class CreateExcavators < ActiveRecord::Migration[5.1]
  def change
    create_table :excavators do |t|
      t.string :company_name
      t.boolean :crew_on_site
      t.jsonb :address
      t.references :ticket, foreign_key: true

      t.timestamps
    end
  end
end
