class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :survey
  belongs_to :questionnaire

  attr_accessible :choice, :questionnaire_id, :user_id, :survey_id

  validates :choice, :presence => true #, :if => lambda { |a| a.survey.current_step == "page1" }

  attr_writer :current_step

  def current_step
    @current_step || steps.first
  end

  def steps
    %w[page1 page2 page3 page4 page5
       page6 page7 page8 page9 page10
       page11 page12 page13 page14 page15
       page16 page17 page18 page19 page20
       page21 page22 page23 page24 page25]
  end

  def next_step
    self.current_step = steps[steps.index(current_step)+1]
  end

  def last_step?
    current_step == steps.last
  end
end
