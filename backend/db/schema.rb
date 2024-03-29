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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_180_425_124_512) do
  create_table 'categories', force: :cascade do |t|
    t.string 'name'
    t.text 'icon'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'chilhood'
  end

  create_table 'job_subcategory_joins', force: :cascade do |t|
    t.integer 'job_id'
    t.integer 'subcategory_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['job_id'], name: 'index_job_subcategory_joins_on_job_id'
    t.index ['subcategory_id'], name: 'index_job_subcategory_joins_on_subcategory_id'
  end

  create_table 'jobs', force: :cascade do |t|
    t.string 'name'
    t.text 'image'
    t.text 'description'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'image_preview'
  end

  create_table 'jobs_subcategories', id: false, force: :cascade do |t|
    t.integer 'job_id', null: false
    t.integer 'subcategory_id', null: false
    t.index %w[job_id subcategory_id], name: 'index_jobs_subcategories_on_job_id_and_subcategory_id'
    t.index %w[subcategory_id job_id], name: 'index_jobs_subcategories_on_subcategory_id_and_job_id'
  end

  create_table 'jobs_users', id: false, force: :cascade do |t|
    t.integer 'user_id', null: false
    t.integer 'job_id', null: false
    t.index %w[job_id user_id], name: 'index_jobs_users_on_job_id_and_user_id'
    t.index %w[user_id job_id], name: 'index_jobs_users_on_user_id_and_job_id'
  end

  create_table 'subcategories', force: :cascade do |t|
    t.string 'name'
    t.text 'icon'
    t.integer 'category_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['category_id'], name: 'index_subcategories_on_category_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'name'
    t.string 'email'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'password_digest'
    t.string 'provider'
    t.string 'uid'
    t.string 'avatar_url'
  end
end
