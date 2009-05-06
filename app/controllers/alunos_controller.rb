class AlunosController < ApplicationController
  layout "home"
  def index
    list
    render :action => "list"
  end

  def list  
    if params[:pesquisa]
      @alunos = Aluno.find(:all, :conditions => "nome like '#{params[:pesquisa][:nome]}'")
    else  
      @alunos = Aluno.find :all, :order => "nome"    
    end  
  end
  
  def cadastrar_responsavel
    render(:partial => "form_responsavel")  
  end

  def editar_responsavel
    render(:partial => "form_responsavel", :id => params[:id])  
  end  
  
  def realizar_pagamento
    render(:partial => "pagamento")  
  end
  
  def agendar_pagamento
    @cursos = Curso.find :all, :order => "nome"    
    render(:partial => "agendar_pagamento")  
  end
  
  def pesquisa
    render(:partial => "pesquisa")      
  end

  def edit
    @cursos = Curso.find :all, :order => "nome"
    if params[:id]
      @aluno = Aluno.find(params[:id])
      @cep = Cep.find(@aluno.cep_id)
    else
      @aluno = Aluno.new
      @cep = Cep.new
    end
    if request.post?
      if @aluno.cep_id
        @cep.attributes = params[:form_cep]
        @aluno.attributes = params[:aluno]
        if @aluno.save && @cep.save
          flash[:notice] = "Aluno atualizado com sucesso!"
          redirect_to :action => "list"
        end
      end
      if @aluno.cep_id == nil 
         @cep = Cep.create(params[:form_cep])
         @aluno.cep_id = @cep.id
         @aluno.attributes = params[:aluno]
         if @aluno.save && @cep.save
           flash[:notice] = "Aluno criado com sucesso! <br>Agora e possivel cadastrar responsavel e agendar pagamento"
           redirect_to :action => "edit", :id  => @aluno
         end
      end 
    end
    session[:aluno_id] = @aluno.id     
  end

  def delete
    Aluno.find(params[:id]).destroy
    flash[:notice] = "O aluno foi excluído com sucesso!"
    redirect_to :action => "list"
  end
end