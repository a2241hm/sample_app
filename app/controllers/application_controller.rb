class ApplicationController < ActionController::Base
  # SessionsHelperの便利メソッドがApplicationControllerでも使える。
  include SessionsHelper
end