# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100208221834) do

  create_table "hulls", :force => true do |t|
    t.string   "name"
    t.float    "length"
    t.float    "width"
    t.float    "height"
    t.integer  "weight"
    t.integer  "mover_type_id"
    t.string   "slug"
    t.float    "deadrise"
    t.text     "description"
    t.text     "configuration"
    t.string   "url"
    t.integer  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "power_min"
    t.integer  "power_max"
    t.integer  "original_id"
    t.integer  "reviewed",      :limit => 1, :default => 0, :null => false
  end

  create_table "hulls_manufacturers", :id => false, :force => true do |t|
    t.integer "hull_id"
    t.integer "manufacturer_id"
  end

  create_table "hulls_properties", :id => false, :force => true do |t|
    t.integer "hull_id"
    t.integer "property_id"
  end

  create_table "images", :force => true do |t|
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.integer  "hull_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "manufacturers", :force => true do |t|
    t.string   "slug"
    t.string   "name"
    t.string   "url"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "properties", :force => true do |t|
    t.string   "type"
    t.string   "slug"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
