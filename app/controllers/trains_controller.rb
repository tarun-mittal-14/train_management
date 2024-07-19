class TrainsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_train, only: [:show, :edit, :update, :destroy]
  before_action :authorize_admin!, except: [:index, :show]

  def index
    if params[:search].present?
      search_query = "%#{params[:search]}%"
      @trains = Train.where('name LIKE ? COLLATE NOCASE OR source LIKE ? COLLATE NOCASE OR destination LIKE ? COLLATE NOCASE OR route LIKE ? COLLATE NOCASE', 
                            search_query, search_query, search_query, search_query)
                     .paginate(page: params[:page], per_page: 2)
    else
      @trains = Train.paginate(page: params[:page], per_page: 2)
    end
  end

  def show
  end

  def new
    @train = Train.new
  end

  def create
    @train = Train.new(train_params)
    if @train.save
      redirect_to @train, notice: 'Train was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @train.update(train_params)
      redirect_to @train, notice: 'Train was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @train.destroy
    redirect_to trains_url, notice: 'Train was successfully destroyed.'
  end

  private

  def set_train
    @train = Train.find(params[:id])
  end

  def train_params
    params.require(:train).permit(:name, :source, :destination, :route, :seats, :image)
  end

  def authorize_admin!
    redirect_to root_path, alert: 'Access Denied' unless current_user.admin?
  end
end
