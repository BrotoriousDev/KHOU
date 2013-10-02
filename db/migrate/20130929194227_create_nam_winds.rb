class CreateNamWinds < ActiveRecord::Migration
  def change
    create_table :nam_winds do |t|
      t.date :startdate
      t.integer :t_18
      t.integer :t_21
      t.integer :t_24
      t.integer :t_27
      t.integer :t_30
      t.integer :t_33
      t.integer :t_36
      t.integer :t_39
      t.integer :t_42
      t.integer :t_45
      t.integer :t_48
      t.integer :t_51
      t.integer :t_54
      t.integer :t_57
      t.integer :t_60
      t.integer :t_63
      t.integer :t_66
      t.integer :t_69
      t.integer :t_72
      t.integer :t_75
      t.integer :t_78

      t.timestamps
    end
  end
end
