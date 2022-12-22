# frozen_string_literal: true

# class determinates automorphic numbers
class AutomorphicController < ApplicationController
  def input
    @data = Result.new
  end

  def output
    received_key = params[:data]['key']
    @data = Result.find_by(key: received_key)
    return unless @data.nil?

    @data = Result.new(key: received_key)
    save_or_redirect
  end

  def browse
    render xml: Result.all.as_json
  end

  private

  def save_or_redirect
    if @data.valid?
      @data.save
    else
      redirect_to '/', alert: @data.errors['key'][0]
    end
  end
end
