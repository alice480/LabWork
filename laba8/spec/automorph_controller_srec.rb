# frozen_string_literal: true

require_relative 'rails_helper'
require 'selenium-webdriver'

RSpec.describe AutomorphicController do
  include RSpec::Expectations
  before(:each) do
    @driver = Selenium::WebDriver.for :firefox
    @base_url = 'http://localhost:3000/'
    @driver.manage.timeouts.implicit_wait = 30
    @verification_errors = []
  end

  after(:each) do
    @driver.quit
  end

  describe 'get index page' do
    context 'check index page by root' do
      it 'has code 200' do
        @driver.get @base_url
        expect(@driver.current_url).to eq('http://localhost:3000/')
      end
    end
  end
end

# bundle exec rspec ./spec/automorph_controller_srec.rb

RSpec.describe AutomorphicController, type: :request do
  describe 'get index page' do
    context 'check index page by root' do
      it 'has code 200' do
        get 'http://localhost:3000/'
        expect(response).to have_http_status(:success)
        expect(response.status).to eq(200)
      end
    end
  end
end

RSpec.describe 'Result table management', js: true, type: :system do
  before do
    options = Selenium::WebDriver::Firefox::Options.new(args: ['-headless'])
    @driver = Selenium::WebDriver.for :firefox, options: options
    Capybara.default_max_wait_time = 5
  end

  it 'user pushed correct number and table created with correct output' do
    @driver.get('http://localhost:3000/')

    #  find form input and fill it
    form = @driver.find_element(id: 'input')
    form.send_keys('80')
    form.submit

    input = { 1 => 1, 5 => 25, 6 => 36, 25 => 625 }
    all('table tr td').each_with_index do |val, ind|
      expect(val).to have_text(input[ind - 1]) if (ind - 1) in input
    end
  end
end
