class Responsavel < ActiveRecord::Base
  belongs_to :cep
  belongs_to :aluno
  
  has_many :debito_material
  has_many :debito_curso
  
  validates_presence_of :nome, :message => "- Campo nome nao foi preenchido"    
  validates_presence_of :estado_civil, :message => "- Campo estado civil nao foi preenchido"      
  validates_presence_of :filiacao, :message => "- Campo filiacao nao foi preenchido"      
  validates_presence_of :sexo, :message => "- Campo sexo nao foi preenchido"      
  validates_presence_of :cpf, :message => "- Campo CPF nao foi preenchido"        
  validates_presence_of :rg, :message => "- Campo RG nao foi preenchido"
  validates_presence_of :data_nascimento, :message => "- Campo data de nascimento nao foi preenchido"            

  validates_presence_of :telefone, :message => "- Campo telefone nao foi preenchido"  
  validates_format_of :telefone, :with => /^\d{4}-\d{4}$/, :message => "- Formato inválido para o telefone"  
  validates_presence_of :celular, :message => "- Campo celular nao foi preenchido"    
  validates_format_of :celular, :with => /^\d{4}-\d{4}$/, :message => "- Formato inválido para o celular"    
  validates_presence_of :complemento, :message => "- Campo complemento nao foi preenchido"  
end
