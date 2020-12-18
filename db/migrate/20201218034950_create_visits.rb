class CreateVisits < ActiveRecord::Migration[6.0]
  def change
    create_table :visits do |t|
      t.string :name
      t.date :data_visita
      t.datetime :checkin
      t.string :checkoutdatetime
      t.string :formulario
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
