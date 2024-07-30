# frozen_string_literal: true

class HomeController < ApplicationController
  skip_before_action :authenticate!, only: [:index]

  def index
    @guest = user_signed_in? ? current_user.email : 'Daily Tracker'
  end
end
