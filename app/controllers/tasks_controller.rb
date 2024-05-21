class TasksController < ApplicationController
  # Autres actions omises pour la clarté
    def index
      @tasks = Task.all
    end

  def edit
    @task = Task.find(params[:id])
  end

  def show
    @task = Task.find(params[:id])
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    redirect_to tasks_url, notice: 'La tâche a été supprimée avec succès.'
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to tasks_path, notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
