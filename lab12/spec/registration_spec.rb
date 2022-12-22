# frozen_string_literal: true

require_relative 'spec_helper'
require_relative 'rails_helper'
require 'selenium-webdriver'


RSpec.describe AutomorphicController, type: :request do
  describe 'get result page' do
    context 'user unlogged' do
      it 'returns alert' do
        get 'http://localhost:3000/input?number=50'
        expect(response.body).to include('alert alert-danger')
      end
    end
  end
end

RSpec.describe 'User is not logged in', js: true, type: :system do
  before do
    options = Selenium::WebDriver::Firefox::Options.new(args: ['-headless'])
    @driver = Selenium::WebDriver.for :firefox, options: options
    Capybara.default_max_wait_time = 5
  end

  let(:output) { [1, 2, 3, 11, 22] }

  it "there is no selector 'number'" do
    @driver.get('http://localhost:3000/')
    expect(page).to have_no_selector('table tr td')
  end

  it 'there is selectors of login and register' do
    @driver.get('http://localhost:3000/')
    form = @driver.find_element(class: 'btn')
    form.submit
  end

  context 'user registers successfully' do
    it 'redirects to the entrance' do
      @driver.get('http://localhost:3000/users/new')

      form_login = @driver.find_element(id: 'user_login')
      form_login.send_keys('login_test')

      form_password = @driver.find_element(id: 'user_password')
      form_password.send_keys('password_test')

      @driver.find_element(:class, 'btn').click

      expect(@driver.current_url).to eq('http://localhost:3000/')
    end
  end

  context 'user successfully logs in' do
    it 'allows to make calculations' do
      @driver.get('http://localhost:3000/users/entry')

      form_login = @driver.find_element(id: 'user_login')
      form_login.send_keys('login_test')

      form_password = @driver.find_element(id: 'user_password')
      form_password.send_keys('password_test')
      
      @driver.find_element(:class, 'btn').click

      expect(@driver.current_url).to eq('http://localhost:3000/input')

      form = @driver.find_element(id: 'data_key')
      form.send_keys('80')
      @driver.find_element(:class, 'btn').click

      input = { 1 => 1, 5 => 25, 6 => 36, 25 => 625 }
      all('table tr td').each_with_index do |val, ind|
        expect(val).to have_text(input[ind - 1]) if (ind - 1) in input
      end
    end
  end
end
