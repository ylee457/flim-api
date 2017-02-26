class FlimsController < ApplicationController
  before_action :set_flim, only: [:show, :update, :destroy]

  # GET /flims
  def index
    @flims = Flim.all

    #render json: @flims

    # pagination support with 
    paginate json: @flims
  end

  # GET /flims/1
  def show
    render json: @flim
  end

  # POST /flims
  def create
    @flim = Flim.new(flim_params)

    if @flim.save
      render json: @flim, status: :created, location: @flim
    else
      render json: @flim.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /flims/1
  def update

    # retrieve the rating from params
    rating = params[:flim][:rating].blank? ? 0 : params[:flim][:rating]

    # convert it to int
    rating_x = rating =~ /[1-5]/ ? rating.to_i : 0

    # add a rating for the flim f we have a rating
    if rating_x > 0
      rating_ = Rating.create(point: rating_x, flim_id: @flim.id)
    end


    if @flim.update(flim_params)
      render json: @flim
    else
      render json: @flim.errors, status: :unprocessable_entity
    end
  end

  # DELETE /flims/1
  def destroy
    @flim.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_flim
      @flim = Flim.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def flim_params
      params.require(:flim).permit(:title, :description, :url_slug, :year)
    end
end
