class ApplicationController < ActionController::Base

  def test
    render plain: "Application running"
  end

end
