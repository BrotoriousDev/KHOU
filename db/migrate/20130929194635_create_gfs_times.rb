class CreateGfsTimes < ActiveRecord::Migration
  def change
    create_table :gfs_times do |t|
      t.date :startdate
      t.datetime :t_18
      t.datetime :t_21
      t.datetime :t_24
      t.datetime :t_27
      t.datetime :t_30
      t.datetime :t_33
      t.datetime :t_36
      t.datetime :t_39
      t.datetime :t_42
      t.datetime :t_45
      t.datetime :t_48
      t.datetime :t_51
      t.datetime :t_54
      t.datetime :t_57
      t.datetime :t_60
      t.datetime :t_63
      t.datetime :t_66
      t.datetime :t_69
      t.datetime :t_72
      t.datetime :t_75
      t.datetime :t_78

      t.timestamps
    end
  end
end
