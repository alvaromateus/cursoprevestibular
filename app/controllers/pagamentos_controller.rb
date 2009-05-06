class PagamentosController < ApplicationController
  layout "home"
  def index
    list
    render :action => "list"
  end

  def list  
    @debito_curso = DebitoCurso.find :all, :order => "valor"
  end

  def agendar
    render :partial => "agendar", :layout => "home"
  end
  
  def realizar
    debito_curso = DebitoCurso.find(params[:debito])
    debito_curso.pago = true
    debito_curso.save
    flash[:notice] = "Debito baixado com sucesso!"
    redirect_to :action => "edit", :controller => "alunos", :id  => session[:aluno_id]    
  end
  
  def realizar_material  
    debito_material = DebitoMaterial.find(params[:debito])
    debito_material.pago = true
    debito_material.save
    flash[:notice] = "Debito baixado com sucesso!"
    redirect_to :action => "edit", :controller => "alunos", :id  => session[:aluno_id]      
  end
  
  def simula
    @prestacao = []
    curso = Aluno.find(session[:aluno_id]).curso
    quantidade =  params[:pagamento][:quantidade]
    desconto = params[:pagamento][:desconto]
    valor_curso = curso.valor_curso - desconto.to_f
    
    dia = Time.now
    dia = dia.next_month
    dia = dia.change(:day => params[:pagamento][:dia])
    i = quantidade.to_i
    while i > 0
      @prestacao.push({:valor_prestacao => valor_curso / quantidade.to_i, :dia => dia})  
      dia = dia.next_month
      i -= 1
    end
    @valor_material = curso.valor_material
    session[:quantidade_prestacoes] = quantidade
    session[:desconto] = desconto
    session[:dia] = params[:pagamento][:dia]
    render(:partial => "prestacoes")    
  end
  
  def confirmar
    aluno = Aluno.find(session[:aluno_id])
    debito_material = DebitoMaterial.new
    debito_material.valor = aluno.curso.valor_material
    debito_material.data_vencimento = Time.now
    debito_material.aluno_id = aluno.id
    if aluno.responsavel
      debito_material.responsavel_id = aluno.responsavel.id
    end
    debito_material.pago = false
    debito_material.save
    
    dia = Time.now
    dia = dia.next_month    
    dia = dia.change(:day => session[:dia])
    i = session[:quantidade_prestacoes].to_i    
    while i > 0
      debito_curso = DebitoCurso.new    
      debito_curso.valor = (aluno.curso.valor_curso - session[:desconto].to_f) / session[:quantidade_prestacoes].to_i
      debito_curso.data_vencimento = dia
      dia = dia.next_month
      debito_curso.aluno_id = aluno.id
      if aluno.responsavel
        debito_curso.responsavel_id = aluno.responsavel.id
      end
      debito_curso.pago = false
      debito_curso.save      
      i -= 1
    end
    flash[:notice] = "Debitos lancados com sucesso!"
    redirect_to :action => "list", :controller => "alunos"    
  end
  
  def delete
    Curso.find(params[:id]).destroy
    flash[:notice] = "O curso foi excluído com sucesso!"
    redirect_to :action => "list"
  end  
end