# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_12_01_032648) do

  create_table "calificacions", force: :cascade do |t|
    t.integer "puntaje"
    t.string "comentario"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "pasaje_id"
    t.index ["pasaje_id"], name: "index_calificacions_on_pasaje_id"
  end

  create_table "combis", force: :cascade do |t|
    t.string "clasificacion"
    t.integer "plazas_totales"
    t.integer "plazas_libres"
    t.string "modelo"
    t.string "patente"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "eliminado", default: false
  end

  create_table "invitados", force: :cascade do |t|
    t.string "nombre"
    t.string "apellido"
    t.string "DNI"
    t.string "integer"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "lugars", force: :cascade do |t|
    t.string "provincia"
    t.string "ciudad"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "eliminado", default: false
  end

  create_table "pasajes", force: :cascade do |t|
    t.float "precio"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "viaje_id"
    t.integer "usuario_id"
    t.integer "calificacion_id"
    t.index ["calificacion_id"], name: "index_pasajes_on_calificacion_id"
    t.index ["usuario_id"], name: "index_pasajes_on_usuario_id"
    t.index ["viaje_id"], name: "index_pasajes_on_viaje_id"
  end

  create_table "pasajes_productos", force: :cascade do |t|
    t.integer "pasaje_id", null: false
    t.integer "producto_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "cantidad", default: 1
    t.index ["pasaje_id"], name: "index_pasajes_productos_on_pasaje_id"
    t.index ["producto_id"], name: "index_pasajes_productos_on_producto_id"
  end

  create_table "productos", force: :cascade do |t|
    t.string "nombre"
    t.string "descripcion"
    t.integer "precio"
    t.integer "stock"
    t.boolean "eliminado", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "ruta", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "nombre"
    t.integer "origen"
    t.integer "destino"
    t.boolean "eliminado", default: false
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "role", default: "usuario"
    t.string "nombre"
    t.string "apellido"
    t.integer "DNI"
    t.boolean "suscripcion"
    t.string "nrotarjeta"
    t.string "codseguridad"
    t.string "telefono"
    t.boolean "eliminado", default: false
    t.integer "vencimientoMes"
    t.integer "vencimientoAño"
    t.index ["email"], name: "index_usuarios_on_email", unique: true
    t.index ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true
  end

  create_table "viajes", force: :cascade do |t|
    t.datetime "fecha"
    t.boolean "eliminado"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "origen"
    t.integer "destino"
    t.integer "ruta"
    t.integer "combi"
    t.integer "chofer"
    t.datetime "fecha_llegada"
  end

  add_foreign_key "pasajes_productos", "pasajes"
  add_foreign_key "pasajes_productos", "productos"
end
