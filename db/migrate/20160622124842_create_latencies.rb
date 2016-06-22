class CreateLatencies < ActiveRecord::Migration
  def change
    create_table :latencies do |t|
      t.time :started
      t.string :url
      t.string :latency
      t.timestamps null: false
    end
  end
end
