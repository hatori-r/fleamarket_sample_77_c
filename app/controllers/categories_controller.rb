class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Categorie.all
    @parents = Category.where(ancestry: nil)
  end

  def show
  end

  def new
    @category = Categorie.new
  end

  def edit
  end

  def create
    @category = Categorie.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: 'Categorie was successfully created.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category, notice: 'Categorie was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Categorie was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_category
      @category = Categorie.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name, :ancestry)
    end
end
