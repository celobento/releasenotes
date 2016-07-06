class CaracteristicaReleasesController < ApplicationController
  
  before_action :set_caracteristica_release, only: [:destroy]
  before_action :release_note_params, only: [:new]
  
  def new
    @caracteristica_release = CaracteristicaRelease.new
    @caracteristicas = Caracteristica.all
  end

  def create
    @caracteristica_release = CaracteristicaRelease.new(caracteristica_release_params)
    if @caracteristica_release.save
      flash[:success] = "Caracteristica adicionada com Sucesso !"
      redirect_to edit_release_note_path busca_release_note(@caracteristica_release.release_note_id) , tab:"caracteristicas"
      
    else
      
    end
  end

  def destroy
    id_release_temp = @caracteristica_release.release_note_id
    @caracteristica_release.destroy
    flash[:success] = "Caracteristica removida com sucesso !"
    redirect_to edit_release_note_path busca_release_note(id_release_temp), tab:"caracteristicas"
  end
  
  private
  
  def set_caracteristica_release
    @caracteristica_release = CaracteristicaRelease.find(params[:id])
  end
  
  def caracteristica_release_params
    params.require(:caracteristica_release).permit(:release_note_id, :caracteristica_id, :descricao)
  end
  
  def release_note_params
    @release_note = ReleaseNote.find(params[:release_id])
  end
  
  def busca_release_note(release_id)
    @release_note = ReleaseNote.find(release_id)
  end
  
end
