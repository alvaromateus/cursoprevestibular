class Curso < ActiveRecord::Base
  has_many :alunos
  validates_presence_of :nome, :message => "- Voce nao preencheu o campo nome"
  validates_presence_of :valor_curso, :message => "- Voce nao preencheu o campo valor do curso"
  validates_presence_of :valor_material, :message => "- Voce nao preencheu o campo valor do material"
end
