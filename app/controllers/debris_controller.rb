class DebrisController < ApplicationController
  before_action :set_debri, only: [:show, :edit, :update, :destroy]

  # GET /debris
  # GET /debris.json
  def index
    @debris = Debri.all
  end

  # GET /debris/1
  # GET /debris/1.json
  def show
  end

  # GET /debris/new
  def new
    @debri = Debri.new
  end

  # GET /debris/1/edit
  def edit
  end

  # POST /debris
  # POST /debris.json
  def create
    @debri = Debri.new(debri_params)

    respond_to do |format|
      if @debri.save
        format.html { redirect_to @debri, notice: 'Debri was successfully created.' }
        format.json { render :show, status: :created, location: @debri }
      else
        format.html { render :new }
        format.json { render json: @debri.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /debris/1
  # PATCH/PUT /debris/1.json
  def update
    respond_to do |format|
      if @debri.update(debri_params)
        format.html { redirect_to @debri, notice: 'Debri was successfully updated.' }
        format.json { render :show, status: :ok, location: @debri }
      else
        format.html { render :edit }
        format.json { render json: @debri.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /debris/1
  # DELETE /debris/1.json
  def destroy
    @debri.destroy
    respond_to do |format|
      format.html { redirect_to debris_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_debri
      @debri = Debri.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def debri_params
      params.require(:debri).permit(:word, :size, :height, :angle, :object_type_id, :deleted)
    end
end
