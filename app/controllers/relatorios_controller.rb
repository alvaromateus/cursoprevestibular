require 'rubygems' 
require 'rghost' 
class RelatoriosController < ApplicationController
  layout "home"
   def index
     list
     render :action => "list"
   end

   def list  

   end
   
   def gerar_pdf
      @aluno = []
      params[:alunos].each do |aluno|
        @aluno.push(Aluno.find(aluno)) # recebo os ids dos alunos para o relatório
      end
      doc=RGhost::Document.new # crio o documento
      RGhost::Config::GS[:path]= '/usr/local/bin/gs' # configuro o caminho para o Ghoscript
      doc.first_page do 
        image "public/images/logo.jpg" # rodapé com logo da empresa
      end 
      doc.define_tags do 
        tag :titulo,  :size => 22, :color => '#ADAD66' # crio o "estilo" titulo
      end      
      
      # escrevo o título do relatório passado por parâmetro, usando o estilo criado acima
      doc.show params[:tipo].to_s, :align => :page_center, :tag => :titulo 
      
      doc.next_row 
      doc.rails_grid :width => 4 do |grid| # crio uma grid conforme os dados estao no banco
         grid.column :id, :title =>"Código" 
         grid.column :nome, :title => "Nome"
         grid.column :telefone, :title => "Telefone"
         grid.column :celular, :title => "Celular"       
         grid.column :data_nascimento, :title => "Data Nascimento"
         grid.style  :bottom_lines        
         grid.data(@aluno) # jogo o objeto aluno na grid
      end
    doc.render :pdf, :filename => "public/alunos.pdf"   # crio o pdf
   end   
   
   def alunos
     @cursos = Curso.find(:all)
     if params[:alunos]
       @alunos = Aluno.find_by_sql("select * from alunos where curso_id='#{params[:alunos][:id]}'")
     end
   end
   
   def inadimplentes    
      @alunos = Aluno.find_by_sql("SELECT * FROM alunos WHERE id in (select aluno_id from debito_cursos where pago=0 and data_vencimento < current_date)")
   end 
end