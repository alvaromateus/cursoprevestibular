class Cep < ActiveRecord::Base
  has_many :alunos
  has_many :responsavels  
  
  validates_presence_of :cep, :message => "- Campo CEP não foi preenchido"
  validates_format_of :cep, :with => /\d{8}/, :message => "- Cep não está no formato certo"
  validates_presence_of :logradouro, :message => "- Campo logradouro não foi preenchido"  
  validates_presence_of :tipo_logradouro, :message => "- Campo tipo logradouro não foi selecionado"    
  validates_presence_of :bairro, :message => "- Campo bairro não foi preenchido"
  validates_presence_of :cidade, :message => "- Campo cidade não foi preenchido"    
  validates_presence_of :uf, :message => "- Campo estado não foi selecionado"    
end
