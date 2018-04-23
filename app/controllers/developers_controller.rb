class DevelopersController < ApplicationController
  def index

    @developers = Developer.all

    if (params[:cl_term].present? || params[:pl_term].present?)
      @search_header = "Developers - " + [params[:cl_term], params[:pl_term]].reject(&:blank?).join(", ")
    elsif
      @search_header = "Developers - All"
    end
  end
end
