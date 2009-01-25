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

ActiveRecord::Schema.define(:version => 20090125180345) do

  create_table "code_solutions", :force => true do |t|
    t.string   "title"
    t.text     "code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "code_test_id"
  end

  create_table "code_statuses", :force => true do |t|
    t.integer  "tests_passed"
    t.integer  "memory_used"
    t.decimal  "speed"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "code_solution_id"
  end

  create_table "code_tests", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "number_of_tests"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "test_frameworks", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "code_test_id"
  end

  create_table "users", :force => true do |t|
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.string   "name"
    t.string   "email_address"
    t.boolean  "administrator",                           :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state",                                   :default => "active"
    t.datetime "key_timestamp"
  end

end
