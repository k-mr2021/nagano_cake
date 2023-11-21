class Admin::CustomersController < ApplicationController
  before_action :authenticate_adimn!
end
