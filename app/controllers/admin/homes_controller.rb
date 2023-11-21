class Admin::HomesController < ApplicationController
  before_action :authenticate_adimn!
  
end

