class Admin::GenresController < ApplicationController
  before_action :authenticate_adimn!
end

