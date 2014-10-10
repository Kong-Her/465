class HomeController < ApplicationController 
  load "#{Rails.root}/lib/ladder.rb"

  def index
    $word1 = dictionary.sample
    $word2 = dictionary.sample
  end

  def show
    @step0 = $word1
    @step6 = $word2
    @step1 = params[:step1]
    @step2 = params[:step2]
    @step3 = params[:step3]
    @step4 = params[:step4]
    @step5 = params[:step5]

    $ary = [@step0, @step1, @step2, @step3, @step4, @step5, @step6, @step7].reject(&:blank?)
    $isLegal = legal $ary    
  end

end
