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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160705010328) do

  create_table "caracteristicas", force: :cascade do |t|
    t.string   "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "defeitos", force: :cascade do |t|
    t.integer  "release_note_id"
    t.string   "descricao"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "defeitos", ["release_note_id"], name: "index_defeitos_on_release_note_id"

  create_table "pessoa_sistemas", force: :cascade do |t|
    t.integer  "sistema_id"
    t.integer  "pessoa_id"
    t.boolean  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "pessoa_sistemas", ["pessoa_id"], name: "index_pessoa_sistemas_on_pessoa_id"
  add_index "pessoa_sistemas", ["sistema_id"], name: "index_pessoa_sistemas_on_sistema_id"

  create_table "pessoas", force: :cascade do |t|
    t.string   "nome"
    t.string   "email"
    t.string   "matricula"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "release_notes", force: :cascade do |t|
    t.integer  "sistema_id"
    t.string   "path_deploy"
    t.string   "contexto"
    t.string   "motivacao"
    t.string   "instrucao_uso"
    t.string   "monitoramento"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "release_notes", ["sistema_id"], name: "index_release_notes_on_sistema_id"

  create_table "sistemas", force: :cascade do |t|
    t.string   "nome"
    t.string   "sigla"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
