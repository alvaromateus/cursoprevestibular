class AdicionarChavesEstrangeiras < ActiveRecord::Migration
  def self.up
    create_table :config do |t|
      execute "alter table alunos add constraint fk_aluno_cep foreign key (cep_id) references ceps (id) on update cascade"
      execute "alter table alunos add constraint fk_aluno_curso foreign key (curso_id) references cursos (id) on update cascade"
    
      execute "alter table responsavels add constraint fk_responsavel_cep foreign key (cep_id) references ceps (id) on update cascade"        
      execute "alter table responsavels add constraint fk_responsavel_aluno foreign key (aluno_id) references alunos (id) on update cascade"
    
      execute "alter table debito_materials add constraint fk_debito_materials_aluno foreign key (aluno_id) references alunos (id) on update cascade"
      execute "alter table debito_materials add constraint fk_debito_materials_responsavel foreign key (responsavel_id) references responsavels (id) on update cascade"

      execute "alter table debito_cursos add constraint fk_debito_cursos_aluno foreign key (aluno_id) references alunos (id) on update cascade"
      execute "alter table debito_cursos add constraint fk_debito_cursos_responsavel foreign key (responsavel_id) references responsavels (id) on update cascade"
    
#      execute "alter table config add constraint fk_config_cep foreign key (cep_id) references ceps (id) on update cascade"
    end
  end

  def self.down
  end
end
