class Admin::ItemsController < ApplicationController
  before_action :authenticate_adimn!
  
end
