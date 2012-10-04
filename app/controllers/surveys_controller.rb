class SurveysController < ApplicationController

  def new
    @user = User.find_by_id(session[:user_id])
    session[:survey_params] ||= {}
    @survey = Survey.new(:name => "murray")
    @answers = 7.times { @survey.answers.build }

    @survey.current_step = session[:answer_step]
  end

  def create
    @user = User.find_by_id(session[:user_id])
    session[:survey_params].deep_merge!(params[:survey]) if params[:survey]
    @survey = Survey.new(:name => params[:survey]["name"])
    @answers = @survey.answers.build(session[:survey_params]["answers"].values)

    @survey.current_step = session[:answer_step]
    if @survey.valid?
      if @survey.last_step?
        @survey.save
      else
        @survey.next_step
      end
      session[:answer_step] = @survey.current_step
    end
    if @survey.new_record?
      flash[:notice] = "Page #{@survey.page} of #{@survey.steps.size}."
      render 'new'
    else
      session[:answer_step] = session[:survey_params] = nil
      flash[:notice] = "Thanks for taking the time to take the survey."
      render 'thanks'
    end
  end

  def thanks

  end

end
