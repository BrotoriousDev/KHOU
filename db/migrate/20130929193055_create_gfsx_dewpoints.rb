class CreateGfsxDewpoints < ActiveRecord::Migration
  def change
    create_table :gfsx_dewpoints do |t|
      t.date :startdate
      t.integer :t_24
      t.integer :t_36
      t.integer :t_48
      t.integer :t_60
      t.integer :t_72
      t.integer :t_84
      t.integer :t_96
      t.integer :t_108
      t.integer :t_120
      t.integer :t_132
      t.integer :t_144
      t.integer :t_156
      t.integer :t_168
      t.integer :t_180
      t.integer :t_192

      t.timestamps
    end
  end
end
