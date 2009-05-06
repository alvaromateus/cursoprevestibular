class ResponsavelsController < ApplicationController
  layout "home"
  def index
    list
    render :action => "list"
  end

  def list  
    @responsavel = Responsavel.find :all, :order => "nome"
  end
  
  def edit
    if params[:id]
      @responsavel = Responsavel.find(params[:id])
      @cep = Cep.find(@responsavel.cep_id)
    else
      @responsavel = Responsavel.new
      @cep = Cep.new
    end
    if request.post?
      if @responsavel.cep_id
        @cep.attributes = params[:form_cep]
        @responsavel.attributes = params[:responsavel]
        @responsavel.aluno_id = session[:aluno_id]
        if @responsavel.save && @cep.save
          flash[:notice] = "Responsavel atualizado com sucesso!"
          redirect_to :controller => "aluno", :action => "edit", :id => session[:aluno_id]
        end
      end
      if @responsavel.cep_id == nil 
         @cep = Cep.create(params[:form_cep])
         @responsavel.cep_id = @cep.id
         @responsavel.attributes = params[:responsavel]
         @responsavel.aluno_id = session[:aluno_id]
         if @responsavel.save && @cep.save
           flash[:notice] = "Responsavel criado com sucesso! "
           redirect_to :controller => "aluno", :action => "edit", :id => session[:aluno_id]
         end
      end       
    end
  end
  
  def delete
    Responsavel.find(params[:id]).destroy
    flash[:notice] = "O responsavel foi excluído com sucesso!"
    redirect_to :action => "list"
  end  
end
