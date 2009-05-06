class CreateResponsavels < ActiveRecord::Migration
  def self.up
    create_table :responsavels do |t|
      t.column :nome, :string, :limit => 30
      t.column :estado_civil, :string, :limit => 20
      t.column :nome_conjuge, :string, :limit => 12
      t.column :filiacao, :string, :limit => 30
      t.column :sexo, :string, :limit => 2
      t.column :cpf, :integer
      t.column :rg, :string, :limit => 20
      t.column :data_nascimento, :date
      t.column :profissao, :string, :limit => 20
      t.column :empresa, :string, :limit => 20
      t.column :telefone, :string, :limit => 12
      t.column :celular, :string, :limit => 12
      t.column :complemento, :string, :limit => 20
      #chave estrangeira
      t.column :cep_id, :integer
      t.column :aluno_id, :integer      
    end
    
  end

  def self.down
    drop_table :responsavels
  end
end
