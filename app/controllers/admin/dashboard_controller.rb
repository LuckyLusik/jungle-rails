class Admin::DashboardController < ApplicationController

  http_basic_authenticate_with name: ENV['SECRET_USER'], password: ENV['SECRET_PASSWORD']

  def show
  end
end
