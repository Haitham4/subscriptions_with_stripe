class EpisodesController < ApplicationController
  before_action :set_episode, only: [:show, :destroy, :edit, :update]

  def index
    @episodes = Episode.all
  end

  def show
  end

  def create
    @episode = Episode.new(get_episode_params)


    respond_to do |format|
      if @episode.save
        format.html { redirect_to @episode, notice: 'Episode was successfully created.' }
        format.json { render :show, status: :created, location: @episode }
      else
        format.html { render :new }
        format.json { render json: @episode.errors, status: :unprocessable_entity }
      end
    end

  end

  def new
    @episode = Episode.new
  end

  def update
  end

  def destroy
  end

  def edit
  end

  private

  def set_episode
    @episode = Episode.find(params[:id])
  end

  def get_episode_params
    params.require(:episode).permit(:name, :description)
  end

end
