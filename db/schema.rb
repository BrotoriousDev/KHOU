# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130929200435) do

  create_table "gfs_dewpoints", :force => true do |t|
    t.date     "startdate"
    t.integer  "t_18"
    t.integer  "t_21"
    t.integer  "t_24"
    t.integer  "t_27"
    t.integer  "t_30"
    t.integer  "t_33"
    t.integer  "t_36"
    t.integer  "t_39"
    t.integer  "t_42"
    t.integer  "t_45"
    t.integer  "t_48"
    t.integer  "t_51"
    t.integer  "t_54"
    t.integer  "t_57"
    t.integer  "t_60"
    t.integer  "t_63"
    t.integer  "t_66"
    t.integer  "t_69"
    t.integer  "t_72"
    t.integer  "t_75"
    t.integer  "t_78"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "gfs_temperatures", :force => true do |t|
    t.date     "startdate"
    t.integer  "t_18"
    t.integer  "t_21"
    t.integer  "t_24"
    t.integer  "t_27"
    t.integer  "t_30"
    t.integer  "t_33"
    t.integer  "t_36"
    t.integer  "t_39"
    t.integer  "t_42"
    t.integer  "t_45"
    t.integer  "t_48"
    t.integer  "t_51"
    t.integer  "t_54"
    t.integer  "t_57"
    t.integer  "t_60"
    t.integer  "t_63"
    t.integer  "t_66"
    t.integer  "t_69"
    t.integer  "t_72"
    t.integer  "t_75"
    t.integer  "t_78"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "gfs_times", :force => true do |t|
    t.date     "startdate"
    t.datetime "t_18"
    t.datetime "t_21"
    t.datetime "t_24"
    t.datetime "t_27"
    t.datetime "t_30"
    t.datetime "t_33"
    t.datetime "t_36"
    t.datetime "t_39"
    t.datetime "t_42"
    t.datetime "t_45"
    t.datetime "t_48"
    t.datetime "t_51"
    t.datetime "t_54"
    t.datetime "t_57"
    t.datetime "t_60"
    t.datetime "t_63"
    t.datetime "t_66"
    t.datetime "t_69"
    t.datetime "t_72"
    t.datetime "t_75"
    t.datetime "t_78"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "gfs_winds", :force => true do |t|
    t.date     "startdate"
    t.integer  "t_18"
    t.integer  "t_21"
    t.integer  "t_24"
    t.integer  "t_27"
    t.integer  "t_30"
    t.integer  "t_33"
    t.integer  "t_36"
    t.integer  "t_39"
    t.integer  "t_42"
    t.integer  "t_45"
    t.integer  "t_48"
    t.integer  "t_51"
    t.integer  "t_54"
    t.integer  "t_57"
    t.integer  "t_60"
    t.integer  "t_63"
    t.integer  "t_66"
    t.integer  "t_69"
    t.integer  "t_72"
    t.integer  "t_75"
    t.integer  "t_78"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "gfsx_dewpoints", :force => true do |t|
    t.date     "startdate"
    t.integer  "t_24"
    t.integer  "t_36"
    t.integer  "t_48"
    t.integer  "t_60"
    t.integer  "t_72"
    t.integer  "t_84"
    t.integer  "t_96"
    t.integer  "t_108"
    t.integer  "t_120"
    t.integer  "t_132"
    t.integer  "t_144"
    t.integer  "t_156"
    t.integer  "t_168"
    t.integer  "t_180"
    t.integer  "t_192"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "gfsx_temperatures", :force => true do |t|
    t.date     "startdate"
    t.integer  "t_24"
    t.integer  "t_36"
    t.integer  "t_48"
    t.integer  "t_60"
    t.integer  "t_72"
    t.integer  "t_84"
    t.integer  "t_96"
    t.integer  "t_108"
    t.integer  "t_120"
    t.integer  "t_132"
    t.integer  "t_144"
    t.integer  "t_156"
    t.integer  "t_168"
    t.integer  "t_180"
    t.integer  "t_192"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "gfsx_times", :force => true do |t|
    t.date     "startdate"
    t.datetime "t_24"
    t.datetime "t_36"
    t.datetime "t_48"
    t.datetime "t_60"
    t.datetime "t_72"
    t.datetime "t_84"
    t.datetime "t_96"
    t.datetime "t_108"
    t.datetime "t_120"
    t.datetime "t_132"
    t.datetime "t_144"
    t.datetime "t_156"
    t.datetime "t_168"
    t.datetime "t_180"
    t.datetime "t_192"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "gfsx_winds", :force => true do |t|
    t.date     "startdate"
    t.integer  "t_24"
    t.integer  "t_36"
    t.integer  "t_48"
    t.integer  "t_60"
    t.integer  "t_72"
    t.integer  "t_84"
    t.integer  "t_96"
    t.integer  "t_108"
    t.integer  "t_120"
    t.integer  "t_132"
    t.integer  "t_144"
    t.integer  "t_156"
    t.integer  "t_168"
    t.integer  "t_180"
    t.integer  "t_192"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "nam_dewpoints", :force => true do |t|
    t.date     "startdate"
    t.integer  "t_18"
    t.integer  "t_21"
    t.integer  "t_24"
    t.integer  "t_27"
    t.integer  "t_30"
    t.integer  "t_33"
    t.integer  "t_36"
    t.integer  "t_39"
    t.integer  "t_42"
    t.integer  "t_45"
    t.integer  "t_48"
    t.integer  "t_51"
    t.integer  "t_54"
    t.integer  "t_57"
    t.integer  "t_60"
    t.integer  "t_63"
    t.integer  "t_66"
    t.integer  "t_69"
    t.integer  "t_72"
    t.integer  "t_75"
    t.integer  "t_78"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "nam_temperatures", :force => true do |t|
    t.date     "startdate"
    t.integer  "t_18"
    t.integer  "t_21"
    t.integer  "t_24"
    t.integer  "t_27"
    t.integer  "t_30"
    t.integer  "t_33"
    t.integer  "t_36"
    t.integer  "t_39"
    t.integer  "t_42"
    t.integer  "t_45"
    t.integer  "t_48"
    t.integer  "t_51"
    t.integer  "t_54"
    t.integer  "t_57"
    t.integer  "t_60"
    t.integer  "t_63"
    t.integer  "t_66"
    t.integer  "t_69"
    t.integer  "t_72"
    t.integer  "t_75"
    t.integer  "t_78"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "nam_times", :force => true do |t|
    t.date     "startdate"
    t.datetime "t_18"
    t.datetime "t_21"
    t.datetime "t_24"
    t.datetime "t_27"
    t.datetime "t_30"
    t.datetime "t_33"
    t.datetime "t_36"
    t.datetime "t_39"
    t.datetime "t_42"
    t.datetime "t_45"
    t.datetime "t_48"
    t.datetime "t_51"
    t.datetime "t_54"
    t.datetime "t_57"
    t.datetime "t_60"
    t.datetime "t_63"
    t.datetime "t_66"
    t.datetime "t_69"
    t.datetime "t_72"
    t.datetime "t_75"
    t.datetime "t_78"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "nam_winds", :force => true do |t|
    t.date     "startdate"
    t.integer  "t_18"
    t.integer  "t_21"
    t.integer  "t_24"
    t.integer  "t_27"
    t.integer  "t_30"
    t.integer  "t_33"
    t.integer  "t_36"
    t.integer  "t_39"
    t.integer  "t_42"
    t.integer  "t_45"
    t.integer  "t_48"
    t.integer  "t_51"
    t.integer  "t_54"
    t.integer  "t_57"
    t.integer  "t_60"
    t.integer  "t_63"
    t.integer  "t_66"
    t.integer  "t_69"
    t.integer  "t_72"
    t.integer  "t_75"
    t.integer  "t_78"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "observations", :force => true do |t|
    t.datetime "datetime"
    t.integer  "temperature"
    t.integer  "dewpoint"
    t.integer  "windspeed"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
