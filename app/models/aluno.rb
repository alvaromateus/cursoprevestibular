class Aluno < ActiveRecord::Base
  belongs_to :cep
  belongs_to :curso
  
  has_many :debito_material
  has_many :debito_curso
  has_one :responsavel
  
  validates_presence_of :curso_id, :message => "- Voce nao selecionou o curso do aluno"  
  validates_presence_of :nome, :message => "- Campo nome nao foi preenchido"    
  validates_presence_of :data_nascimento, :message => "- Campo data de nascimento nao foi preenchido"      
  validates_presence_of :sexo, :message => "- Campo sexo nao foi preenchido"      
  validates_presence_of :nome_pai, :message => "- Campo nome do pai nao foi preenchido"
  validates_presence_of :nome_mae, :message => "- Campo nome da mae nao foi preenchido"  
  validates_presence_of :telefone, :message => "- Campo telefone nao foi preenchido"  
  validates_format_of :telefone, :with => /^\d{4}-\d{4}$/, :message => "- Formato inválido para o telefone"  
  validates_presence_of :celular, :message => "- Campo celular nao foi preenchido"    
  validates_format_of :celular, :with => /^\d{4}-\d{4}$/, :message => "- Formato inválido para o celular"    
  validates_presence_of :complemento, :message => "- Campo complemento nao foi preenchido"      
end
