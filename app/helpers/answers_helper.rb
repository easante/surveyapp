module AnswersHelper
#  def question(indx)
#    Questionnaire.order('id asc')[indx].question
#  end

  def question(indx)
    Questionnaire.questions[indx]
  end

  def question_num(indx)
    Questionnaire.order('id asc')[indx].id
  end
end
