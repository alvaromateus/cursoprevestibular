class CreateDebitoMaterials < ActiveRecord::Migration
  def self.up
    create_table :debito_materials do |t|
      t.column :valor, :decimal, :precision =>10, :scale =>2
      t.column :data_vencimento, :date
      t.column :pago, :boolean      
      #chave estrangeira
      t.column :aluno_id, :integer
      t.column :responsavel_id, :integer      
    end
  end

  def self.down
    drop_table :debito_materials    
  end
end
