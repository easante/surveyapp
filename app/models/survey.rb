class Survey < ActiveRecord::Base
  attr_accessible :answers, :name
  has_many :answers
  has_one :user

  attr_writer :current_step
  accepts_nested_attributes_for :answers

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

  def page
    steps.index(current_step) + 1
  end

end
