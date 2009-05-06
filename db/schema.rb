# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 2147483647) do

  create_table "alunos", :force => true do |t|
    t.string  "nome",            :limit => 30
    t.date    "data_nascimento"
    t.string  "sexo",            :limit => 2
    t.integer "cpf"
    t.string  "rg",              :limit => 20
    t.string  "nome_pai",        :limit => 30
    t.string  "nome_mae",        :limit => 30
    t.string  "telefone",        :limit => 12
    t.string  "celular",         :limit => 12
    t.string  "complemento",     :limit => 20
    t.string  "responsavel",     :limit => 1
    t.string  "status",          :limit => 8
    t.integer "cep_id"
    t.integer "curso_id"
  end

  add_index "alunos", ["cep_id"], :name => "fk_aluno_cep"
  add_index "alunos", ["curso_id"], :name => "fk_aluno_curso"

  create_table "ceps", :force => true do |t|
    t.integer "cep"
    t.string  "logradouro",      :limit => 60
    t.string  "tipo_logradouro", :limit => 20
    t.string  "bairro",          :limit => 30
    t.string  "cidade",          :limit => 30
    t.string  "uf",              :limit => 2
  end

  create_table "config", :force => true do |t|
  end

  create_table "cursos", :force => true do |t|
    t.string  "nome",           :limit => 30
    t.decimal "valor_curso",                  :precision => 10, :scale => 2
    t.decimal "valor_material",               :precision => 10, :scale => 2
  end

  create_table "debito_cursos", :force => true do |t|
    t.decimal "valor",           :precision => 10, :scale => 2
    t.date    "data_vencimento"
    t.boolean "pago"
    t.integer "aluno_id"
    t.integer "responsavel_id"
  end

  add_index "debito_cursos", ["aluno_id"], :name => "fk_debito_cursos_aluno"
  add_index "debito_cursos", ["responsavel_id"], :name => "fk_debito_cursos_responsavel"

  create_table "debito_materials", :force => true do |t|
    t.decimal "valor",           :precision => 10, :scale => 2
    t.date    "data_vencimento"
    t.boolean "pago"
    t.integer "aluno_id"
    t.integer "responsavel_id"
  end

  add_index "debito_materials", ["aluno_id"], :name => "fk_debito_materials_aluno"
  add_index "debito_materials", ["responsavel_id"], :name => "fk_debito_materials_responsavel"

  create_table "responsavels", :force => true do |t|
    t.string  "nome",            :limit => 30
    t.string  "estado_civil",    :limit => 20
    t.string  "nome_conjuge",    :limit => 12
    t.string  "filiacao",        :limit => 30
    t.string  "sexo",            :limit => 2
    t.integer "cpf"
    t.string  "rg",              :limit => 20
    t.date    "data_nascimento"
    t.string  "profissao",       :limit => 20
    t.string  "empresa",         :limit => 20
    t.string  "telefone",        :limit => 12
    t.string  "celular",         :limit => 12
    t.string  "complemento",     :limit => 20
    t.integer "cep_id"
    t.integer "aluno_id"
  end

  add_index "responsavels", ["cep_id"], :name => "fk_responsavel_cep"
  add_index "responsavels", ["aluno_id"], :name => "fk_responsavel_aluno"

end
