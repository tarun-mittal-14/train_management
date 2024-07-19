class TrainsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_train, only: [:show, :edit, :update, :destroy]

  def index
    if params[:search].present?
      search_query = "%#{params[:search]}%"
      @trains = Train.where("name ILIKE :search_query OR source ILIKE :search_query OR destination ILIKE :search_query OR route ILIKE :search_query",
                      search_query: "%#{search_query}%")
              .paginate(page: params[:page], per_page: 4)
    else
      @trains = Train.paginate(page: params[:page], per_page: 4)
    end
  end

  def show
  end

  def new
    @train = Train.new
  end

  def create
    trains = Train.all
    byebug
    @train = Train.new(train_params)
    # check(train_params)
    duplicate = trains.where(source: train_params[:source]).present? && (trains.where(destination: train_params[:destination]).present?)
    if duplicate 
      redirect_to new_train_path
      flash[:notice] =  'Train with source and destination already exist' 
    else
      if @train.save
        redirect_to root_path
        flash[:notice] = 'Train was successfully created.'
      else
        render :new
      end
    end
  end

  # def check(train_params)
  #   t = Train.all
  #    a = t.where(source: train_params[:source]).present? && (t.where(destination: train_params[:destination]).present?)
  #   if a 
  #     redirect_to new_train_path and return flash[:notice] =  'Train with source and destination already exist'
  #   end
  # end

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
    redirect_to root_path
     flash[:notice] = 'Train was successfully destroyed.'
  end

  private

  def set_train
    @train = Train.find(params[:id])
  end

  def train_params
    params.require(:train).permit(:name, :source, :destination, :route, :seats, :image)
  end
end
