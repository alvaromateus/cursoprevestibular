class DebitoCurso < ActiveRecord::Base
  belongs_to :aluno
  belongs_to :responsavel
end
