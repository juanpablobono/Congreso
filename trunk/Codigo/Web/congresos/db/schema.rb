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

ActiveRecord::Schema.define(version: 20160410221840) do

  create_table "administradores", force: :cascade do |t|
    t.string   "nombre"
    t.string   "apellido"
    t.string   "usuario"
    t.string   "password_digest"
    t.string   "tipo"
    t.string   "telefono"
    t.string   "email"
    t.boolean  "activo",          default: true
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "cursos", force: :cascade do |t|
    t.string   "nombre"
    t.text     "descripcion"
    t.boolean  "activo",      default: true
    t.datetime "dia_hora",    default: '2016-04-03 14:55:15'
    t.integer  "duracion"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.integer  "evento_id"
  end

  add_index "cursos", ["evento_id"], name: "index_cursos_on_evento_id"

  create_table "eventos", force: :cascade do |t|
    t.date     "fecha_inicio", default: '2016-04-03'
    t.date     "fecha_fin",    default: '2016-04-03'
    t.text     "descripcion"
    t.string   "lugar"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "inscripciones", force: :cascade do |t|
    t.string   "fecha_alta"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "evento_id"
    t.integer  "curso_id"
    t.integer  "usuario_id"
  end

  add_index "inscripciones", ["curso_id"], name: "index_inscripciones_on_curso_id"
  add_index "inscripciones", ["evento_id"], name: "index_inscripciones_on_evento_id"
  add_index "inscripciones", ["usuario_id"], name: "index_inscripciones_on_usuario_id"

  create_table "localidades", force: :cascade do |t|
    t.string   "nombre"
    t.integer  "provincia_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "codigo_postal"
  end

  add_index "localidades", ["provincia_id"], name: "index_localidades_on_provincia_id"

  create_table "paises", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "permisos", force: :cascade do |t|
    t.integer  "seccion_id"
    t.integer  "administrador_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "permisos", ["administrador_id"], name: "index_permisos_on_administrador_id"
  add_index "permisos", ["seccion_id"], name: "index_permisos_on_seccion_id"

  create_table "provincias", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "pais_id"
  end

  add_index "provincias", ["pais_id"], name: "index_provincias_on_pais_id"

  create_table "secciones", force: :cascade do |t|
    t.string   "nombre"
    t.integer  "seccion_padre_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "secciones", ["seccion_padre_id"], name: "index_secciones_on_seccion_padre_id"

  create_table "sesiones", force: :cascade do |t|
    t.string   "inicio_sesion"
    t.string   "uuid"
    t.integer  "usuario_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "sesiones", ["usuario_id"], name: "index_sesiones_on_usuario_id"

  create_table "usuarios", force: :cascade do |t|
    t.string   "nombre"
    t.string   "apellido"
    t.string   "email"
    t.string   "contrasenia"
    t.string   "fecha_nacimiento"
    t.string   "domicilio"
    t.string   "telefono"
    t.string   "dni"
    t.string   "piso"
    t.string   "departamento"
    t.integer  "legajo"
    t.boolean  "activo"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "evento_id"
    t.integer  "localidad_id"
  end

  add_index "usuarios", ["evento_id"], name: "index_usuarios_on_evento_id"
  add_index "usuarios", ["localidad_id"], name: "index_usuarios_on_localidad_id"

end
