class CreateTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :tickets do |t|
      t.string :request_number
      t.integer :sequence_number
      t.string :request_type
      t.timestamp :response_due_date_time
      t.string :primary_service_area_code
      t.string :additional_service_area_codes, array: true, default: []
      t.text :well_known_text

      t.timestamps
    end
  end
end
