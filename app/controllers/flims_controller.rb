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


    # 
    puts "****Update is called....\n\n"
    puts "params[:rating] is #{params[:rating]}\n"
    puts "params[:flim][:description] is #{params[:flim][:description]}\n"
    puts "params[:flim][:title] is #{params[:flim][:title]}\n"

    # retrieve the rating from params
    #rating = !params.dig(:flim, :rating) ? 0 : params[:flim][:rating]
    rating = !params.has_key?(:rating) ? 0 : params[:rating]

    puts "Rating is #{rating}"

    # convert it to int
    rating_x = rating =~ /[1-5]/ ? rating.to_i : 0

    # add a rating for the flim if we have a rating
    if rating_x > 0
      rating_ = Rating.create(point: rating_x, flim_id: @flim.id)

      puts "Rating #{rating_.inspect} is created for flim id #{@flim.id}\n"
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
