class CreateAlunos < ActiveRecord::Migration
  def self.up
    create_table :alunos do |t|
      t.column :nome, :string, :limit => 30
      t.column :data_nascimento, :date      
      t.column :sexo, :string, :limit => 2
      t.column :cpf, :integer
      t.column :rg, :string, :limit => 20
      t.column :nome_pai, :string, :limit => 30
      t.column :nome_mae, :string, :limit => 30 
      t.column :telefone, :string, :limit => 12
      t.column :celular, :string, :limit => 12
      t.column :complemento, :string, :limit => 20
      t.column :responsavel, :string, :limit => 1 # S aluno eh o responsavel - N responsavel relacionado a ele
      t.column :status, :string, :limit => 8 # ativo e inativo (alunos antigos)
      #chave estrangeira
      t.column :cep_id, :integer
      t.column :curso_id, :integer      
    end
  end

  def self.down
    drop_table :alunos    
  end
end
