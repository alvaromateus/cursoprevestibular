class CursosController < ApplicationController
  layout "home"
  def index
    @cursos = Curso.find :all, :order => "nome"
    
  end

  def edit
    if params[:id]
      @curso = Curso.find(params[:id])
      modo = 1
    else
      @curso = Curso.new
    end
    if request.post?
      @curso.attributes = params[:curso]
      if @curso.save
        flash[:notice] = "Curso salvo com sucesso!"
        redirect_to :action => "index"          
      end
    end
  end

  def delete
    Curso.find(params[:id]).destroy
    flash[:notice] = "O curso foi excluído com sucesso!"
    redirect_to :action => "list"
  end
end
