class NamesController < ApplicationController
  before_action :set_name, only: [:show, :edit, :update]
  # GET /names
  # GET /names.json
  def index
  end

  # GET /names/1
  # GET /names/1.json
  def show
  end

  def import

  end

  # GET /names/new
  def new
    @name = Name.new
  end

  # GET /names/1/edit
  def edit
  end

  def show_names
    @names = Name.all
  end

  # POST /names
  # POST /names.json
  def create
    status = Name.create_names(csv_params)
    respond_to do |format|
      if(status == false)
        flash[:alert] = 'Error while processing csv!'
        format.html {redirect_to action: :index}
      else
        flash[:notice] = 'CSV processed'
        format.html{redirect_to action: :show_names}
      end
    end
  end

  # PATCH/PUT /names/1
  # PATCH/PUT /names/1.json
  def update
    respond_to do |format|
      if @name.update(name_params)
        format.html { redirect_to @name, notice: 'Name was successfully updated.' }
        format.json { render :show, status: :ok, location: @name }
      else
        format.html { render :edit }
        format.json { render json: @name.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /names/1
  # DELETE /names/1.json
  def destroy
    @name.destroy
    respond_to do |format|
      format.html { redirect_to names_url, notice: 'Name was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_name
      @name = Name.find(params[:id])
    end

    def csv_params
      params.require(:csv)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def name_params
      params.require(:name).permit(:first_name, :first_name_count)
    end
end
