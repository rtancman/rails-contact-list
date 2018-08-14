class StaticPagesController < ApplicationController
  def index
    redirect_to contacts_path if user_signed_in?
  end

  def about
  end

  def contact
  end
end
