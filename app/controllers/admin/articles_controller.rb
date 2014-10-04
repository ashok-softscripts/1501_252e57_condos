class Admin::ArticlesController < ApplicationController
	layout "admin"
	before_filter :set_nav
  before_action :set_article, only: [:show, :edit, :update, :destroy]


  # GET /articles/new
  def new
    @article = Article.new
		@article.update_section = true if params[:update]
		@article.detail_section = true if params[:detail]
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)
		@article.update_section = params[:article][:update_section]
		@article.detail_section = params[:article][:detail_section]
    respond_to do |format|
      if @article.save
        format.html { redirect_to admin_content_path, notice: 'Article was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to admin_content_path, notice: 'Article was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to admin_content_path }
    end
  end

  private

		def set_nav
			@nav = :contents
		end

    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :description,:published_date, :article)
    end
end
