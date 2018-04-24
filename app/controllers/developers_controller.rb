class DevelopersController < ApplicationController
  def index

    @developers = Developer.all

    pl_term = params[:pl_term]
    cl_term = params[:cl_term]

    if (pl_term.present?)
      pl_term = pl_term.downcase
      @search_header = "Developers - " + [cl_term, pl_term].reject(&:blank?).join(", ")

      @developers = @developers.joins(:programming_languages, :languages)
        .where("programming_languages.name = ? ", pl_term)

      if (cl_term.present?)
        cl_term = cl_term.downcase
        @developers = @developers.joins(:languages)
          .where("languages.code = ?", cl_term)
      end

    else
      @search_header = "Developers - All"
    end
  end
end
