# frozen_string_literal: true

# class determinates automorphic numbers
class AutomorphicController < ApplicationController
  def input
    p flash[:notice]
  end

  def automorph?(number)
    squared = (number**2).to_s
    squared[squared.length - number.to_s.length..squared.length - 1] == number.to_s
  end

  def output
    @n = params[:input]
    return unless check_input

    @result = (1..params[:input].to_i).each.select { |num| num if automorph?(num.to_i) }.map { |i| [i, i**2] }
    
    respond_to do |format|
      format.turbo_stream { render :output }
    end
  
  end

  private

  def check_input
    if Float(@n, exception: false)
      if Float(@n) < 1 || Float(@n) > 100
        redirect_to '/', notice: 'Введите число от 1 до 100'
        return false
      end
    else
      redirect_to '/', notice: 'Введите число!'
      return false
    end
    true
  end
end
