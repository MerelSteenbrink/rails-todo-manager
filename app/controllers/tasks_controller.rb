class TasksController < ApplicationController
	# Add the controller and inmediately the view
before_action :set_task, only: [:show, :edit, :update, :destroy]


def index
	@tasks = Task.all
end

def show
	@task = Task.find(params[:id])
end

# Goal is: render a form to ge the info
# (new.html.erb)
def new
	@task = Task.new
end

def create
	Task.create(task_params)
	redirect_to tasks_path
end

def edit
	# @task = Task.find(params[:id])
end

def update
	# @task = Task.find(params[:id])
	@task.update(task_params)
	redirect_to task_path(@task)
end

def destroy
	# @task= Task.find(params[:id])
	@task.destroy
	redirect_to tasks_path
end


private
def task_params
	params.require(:task).permit(:title, :details, :completed)
end


def set_task
	@task= Task.find(params[:id])
end


end
