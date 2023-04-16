class StaticPagesController < ApplicationController
  def home
    # render ...
    # homeアクションに何も記載されていない。
    # => /app/views/static_pages/home.html.erb
  end

  # app/views/コントローラ名/アクション名.html.erb
  def help
  end
end
