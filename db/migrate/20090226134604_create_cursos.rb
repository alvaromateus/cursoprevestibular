class CreateCursos < ActiveRecord::Migration
  def self.up
    create_table :cursos do |t|
      t.column :nome, :string, :limit => 30
      t.column :valor_curso, :decimal, :precision =>10, :scale =>2
      t.column :valor_material, :decimal, :precision =>10, :scale =>2
    end      
  end

  def self.down
    drop_table :cursos    
  end
end
