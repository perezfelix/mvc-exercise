# frozen_string_literal: true

class AdministrationController < ApplicationController
  before_action :authenticate_admin!, except: [:index]
  layout "administration"
  def index
    super
  end
end
