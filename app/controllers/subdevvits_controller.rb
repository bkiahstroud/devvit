# frozen_string_literal: true

class SubdevvitsController < ApplicationController
  before_action :set_subdevvit, only: %i[show edit update destroy]

  # GET /subdevvits or /subdevvits.json
  def index
    @subdevvits = Subdevvit.all
  end

  # GET /subdevvits/1 or /subdevvits/1.json
  def show
    @posts = Post.where(subdevvit_id: @subdevvit.id)

    render 'posts/index'
  end

  # GET /subdevvits/new
  def new
    @subdevvit = Subdevvit.new
  end

  # GET /subdevvits/1/edit
  def edit; end

  # POST /subdevvits or /subdevvits.json
  def create
    @subdevvit = Subdevvit.new(subdevvit_params)

    respond_to do |format|
      if @subdevvit.save
        format.html { redirect_to @subdevvit, notice: 'Subdevvit was successfully created.' }
        format.json { render :show, status: :created, location: @subdevvit }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @subdevvit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subdevvits/1 or /subdevvits/1.json
  def update
    respond_to do |format|
      if @subdevvit.update(subdevvit_params)
        format.html { redirect_to @subdevvit, notice: 'Subdevvit was successfully updated.' }
        format.json { render :show, status: :ok, location: @subdevvit }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @subdevvit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subdevvits/1 or /subdevvits/1.json
  def destroy
    @subdevvit.destroy
    respond_to do |format|
      format.html { redirect_to subdevvits_url, notice: 'Subdevvit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_subdevvit
    @subdevvit = Subdevvit.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def subdevvit_params
    params.require(:subdevvit).permit(:name, :description)
  end
end
