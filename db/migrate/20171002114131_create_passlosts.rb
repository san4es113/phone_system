class CreatePasslosts < ActiveRecord::Migration[5.1]
  def change
    create_table :passlosts do |t|
      t.string :trSeparation
      t.integer :carrierFrequency
      t.integer :txAntennaHeight
      t.integer :rxAntennaHeight
      t.integer :user_id

      t.timestamps
    end
    add_index :passlosts, :user_id
  end
end
