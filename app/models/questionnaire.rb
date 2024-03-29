class Questionnaire < ActiveRecord::Base
  attr_accessible :question

  has_many :answers
  has_many :users, :through => :answers

  def self.questions
    questions_array = [
      %q{There is a God or gods which influence the world},
      %q{If we don't move to green technologies we will destroy the world},
      %q{Humans can make a perfect world},
      %q{We would be better off if there were no new technologies},
      %q{People who suffer natural disasters probably had it coming},
      %q{It is better if economies don't keep growing},
      %q{History tells us where we have been to guide where we are going},
      %q{It is not wrong to take your own life},
      %q{My family is anyone with the same last name},
      %q{All human life has value},
      %q{Life is a struggle to discover my purpose},
      %q{There are some things we can never know},
      %q{Heaven is a real place},
      %q{The role of a corporation is to maximize shareholder value},
      %q{Animals are as intelligent as humans},
      %q{Large organizations are always corrupt},
      %q{There is a God but He only helps those who help themselves},
      %q{Poverty results from poor decisions},
      %q{Small scale mining is better than large scale mining},
      %q{Kids who are bullied should suck it up or fight back},
      %q{We have to act to save the earth},
      %q{Laws should reflect the culture},
      %q{Things like 'do not steal' are always true},
      %q{If I had to choose a human or a whale I would choose the whale},
      %q{Evil exists and some people are evil},
      %q{If we can't touch, smell, taste, see or hear it, it doesn't exist},
      %q{Complex things are mostly reliable},
      %q{War is always wrong},
      %q{God loves me and cares about me},
      %q{Human intelligence has not changed over millions of years},
      %q{The gods will answer if you ask them properly},
      %q{The world is evolved by internal influences},
      %q{There is no way of knowing whether anything exists},
      %q{I don't believe horoscopes but read them because you never know},
      %q{Humans are really just a plague},
      %q{Knowing history is interesting but not important},
      %q{People should obey laws even if they think the laws are harmful},
      %q{We are responsible to protect the environment},
      %q{Life is about the survival of the fittest},
      %q{I need my cell phone},
      %q{Governments are necessary to build good societies},
      %q{The world would be perfect if humans were not in it},
      %q{People who get aid should have to work for it},
      %q{Animals build more sustainable worlds than humans},
      %q{Everyone is responsible for their own retirement/health care},
      %q{Life on earth is a taste of life to come},
      %q{Taxes should be used to reduce income disparity},
      %q{Life just happens and I want to enjoy what I can},
      %q{The government is responsible for my retirement/health care},
      %q{Humans are apes without hair},
      %q{Some human life has limited or no value},
      %q{The world is evolving as it should},
      %q{Economies are built on technological advance},
      %q{People who don't know history are doomed to repeat it},
      %q{Our lives are better because of technological advances},
      %q{Science and technology have given us control over the world},
      %q{The problem is not shortage but distribution of resources},
      %q{There may be a God or gods but they have no influence over me},
      %q{Humans can destroy the earth},
      %q{The world is a scary and uncontrollable place},
      %q{Aboriginal cultures are better than Western cultures},
      %q{Resource development destroys the environment},
      %q{I want to make the world a better place},
      %q{History is boring and irrelevant},
      %q{Technology is a curse},
      %q{I like finding out more information about my family},
      %q{The world was created by external forces},
      %q{I will do anything to protect my family},
      %q{I prefer to work than to retire},
      %q{I was born to love and be loved; and then I die},
      %q{Everyone should pay taxes},
      %q{When I die my body will rot and I will cease to be},
      %q{The more we try to save the earth the more damage we do},
      %q{Humans always mess things up},
      %q{Everyone is corrupt if they get the chance},
      %q{There is something wrong with the world},
      %q{Wealthy people should pay higher taxes than poor people},
      %q{I was born for a purpose},
      %q{The government should help poor people},
      %q{We can live without resource development},
      %q{Corporations care about profits and not people},
      %q{History is a circular story that keeps repeating itself},
      %q{There is no natural law},
      %q{Whether stealing is wrong depends upon the situation},
      %q{I don't trust authority},
      %q{I was born to make money and live well},
      %q{Governments should have defined and restricted roles},
      %q{Poverty makes people do bad things},
      %q{There is more to the world than what our senses take in},
      %q{Increasing complexity leads to a tipping point into chaos},
      %q{Inti Raymi is real},
      %q{In the future there will be nothing humans won't know},
      %q{Capital punishment is wrong},
      %q{It is ok to sacrifice animals to improve the chances of finding gold},
      %q{My family should help me in my retirement},
      %q{We can prove that we exist},
      %q{I am on my own in this world and it is up to me},
      %q{Sometimes war is necessary to stop madmen},
      %q{All people are basically good},
      %q{Human life is more important than anything else},
      %q{All cultures are morally equivalent},
      %q{Justice is for the rich},
      %q{There is no moral truth},
      %q{Mountain gods control access to gold and silver},
      %q{The earth will heal itself no matter what we do},
      %q{Bullies should be punished},
      %q{My family consists of my children and spouse},
      %q{Members of NGO's should be on corporate boards},
      %q{The world can never be made perfect},
      %q{Large corporations are always corrupt},
      %q{There is no purpose to my or anyone's life},
      %q{Third World nations should require corporations to deliver justice},
      %q{There is nothing seriously wrong with humanity},
      %q{There should be fewer laws which don't change},
      %q{I believe in Heaven and Hell},
      %q{I would pay higher taxes to reduce homelessness},
      %q{There is no such place as Heaven or Hell},
      %q{I can't wait to retire},
      %q{The people I live with are my family},
      %q{We will continue to evolve and get more intelligent},
      %q{History has a beginning and an end},
      %q{A simple life is better than a materialistic life},
      %q{History is a construct and real history can't be known},
      %q{Life begins at conception},
      %q{Burning trees helps the rains come},
      %q{The worlds resources are disappearing},
      %q{Resource development is necessary to our way of life},
      %q{Only people and not organizations can be corrupt},
      %q{There is no such thing as God or gods},
      %q{There is no shortage of oil in the world},
      %q{What works in one culture may not work in another},
      %q{Science and reason are more important than faith and superstition},
      %q{We can't prove that we exist},
      %q{Complex things are mostly unreliable},
      %q{Strong economies are built on moral foundations},
      %q{If a policeman told me to kill or be killed, I would kill},
      %q{Only people who pay taxes should vote},
      %q{The courts will protect poor people},
      %q{The environment is more important than humans},
      %q{The more we know, the more we know what we don't know},
      %q{New technologies will always help us keep costs down},
      %q{Humans are the most important thing},
      %q{Competition is the basis of a strong economy},
      %q{There is a God or gods which influence the world},
      %q{If we don't move to green technologies we will destroy the world},
      %q{Humans can make a perfect world},
      %q{We would be better off if there were no new technologies},
      %q{People who suffer natural disasters probably had it coming},
      %q{It is better if economies don't keep growing},
      %q{History tells us where we have been to guide where we are going},
      %q{It is not wrong to take your own life},
      %q{My family is anyone with the same last name},
      %q{All human life has value},
      %q{Life is a struggle to discover my purpose},
      %q{There are some things we can never know},
      %q{Heaven is a real place},
      %q{The role of a corporation is to maximize shareholder value},
      %q{Animals are as intelligent as humans},
      %q{Large organizations are always corrupt},
      %q{There is a God but He only helps those who help themselves},
      %q{Poverty results from poor decisions},
      %q{Small scale mining is better than large scale mining},
      %q{Kids who are bullied should suck it up or fight back},
      %q{We have to act to save the earth},
      %q{Laws should reflect the culture},
      %q{Things like 'do not steal' are always true},
      %q{If I had to choose a human life or a whale's live I would choose the whale},
      %q{Evil exists and some people are evil},
      %q{If we can't touch, smell, taste, see or hear it, it doesn't exist}
    ]
  end
end
