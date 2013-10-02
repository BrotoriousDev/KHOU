class CreateGfsxTimes < ActiveRecord::Migration
  def change
    create_table :gfsx_times do |t|
      t.date :startdate
      t.datetime :t_24
      t.datetime :t_36
      t.datetime :t_48
      t.datetime :t_60
      t.datetime :t_72
      t.datetime :t_84
      t.datetime :t_96
      t.datetime :t_108
      t.datetime :t_120
      t.datetime :t_132
      t.datetime :t_144
      t.datetime :t_156
      t.datetime :t_168
      t.datetime :t_180
      t.datetime :t_192

      t.timestamps
    end
  end
end
