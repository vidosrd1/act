class ApplicationController < ActionController::Base
  include Pagy::Backend
  #after_action :update_user_online, if: :user_signed_in?

  private
  def articles
    @articles ||= Article.new("https://baconipsum.com/") do |f|
      f.response :json
    end
  end
  #def update_user_online
  #  current_user.try :touch
  #end
end
