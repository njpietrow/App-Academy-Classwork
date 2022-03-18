class Api::BenchesController < ApplicationController
  def index
    @benches = bounds ? Bench.in_bounds(bounds) : Bench.all

    @benches = @benches.select do |bench|
      bench.seating >= min_seating.to_i && bench.seating <= max_seating.to_i
    end

    render :index
  end

  def create
    @bench = Bench.new(bench_params)
    if @bench.save
      render :show
    else
      render json: @bench.errors.full_messages , status: 401
    end
  end

  private
  def bench_params
    params.require(:bench)
      .permit(:description, :lat, :lng, :seating, :max_seating, :min_seating)
  end

  def bounds
    params[:bounds]
  end

  def max_seating
    params[:maxSeating] ? params[:maxSeating] :  10
    
  end

  def min_seating
    params[:minSeating] ? params[:minSeating] :  1
  end
end
