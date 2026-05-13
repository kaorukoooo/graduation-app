class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:top]

  def top
    redirect_to person_records_path if user_signed_in?
  end
end
