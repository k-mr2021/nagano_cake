class Admin::OrdersController < ApplicationController
  before_action :authenticate_adimn!
  
end
