class ExercisesController < ApplicationController
    before_action :redirect_if_not_logged_in

    def new
        @exercise = Exercise.new
    end

    def create
        # byebug
        @exercise = Exercise.new(exercise_params)
        if @exercise.save
            redirect_to exercise_path(@exercise)
        else
            render :new
        end
    end

    def show
        @exercise = Exercise.find(params[:id])
    end

    def index
        if params[:target_area]
            @exercises = Exercise.find_by_target_area(params[:target_area]).order_by_name
        else
            @exercises = Exercise.order_by_name
        end
    end

    def most_popular
        @exercises = Exercise.most_popular
        render :index
    end

    private 

    def exercise_params
        params.require(:exercise).permit(:name, :target_area, :category)
    end
end
