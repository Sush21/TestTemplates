class CommsController < ApplicationController
  include CommsHelper
  before_action :set_comm, only: [:show, :edit, :update, :destroy]

  # GET /comms
  # GET /comms.json
  def index
    @comms = Comm.all
  end

  # GET /comms/1
  # GET /comms/1.json
  def show
    @comm.cinfo ||= "{}"
    @pin = ActiveSupport::JSON.decode(@comm.cinfo)
    action = params[:page] || "index"
    render "t1/#{action}" ,layout:false
  end

  # GET /comms/new
  def new
    @comm = Comm.new
    @pin ={}
    @pin = fill_default_pin(@pin)
  end

  # GET /comms/1/edit
  def edit
    @pin ={}
    @pin = fill_default_pin(@pin)
  end

  # POST /comms
  # POST /comms.json
  def create
    
    @pin = fill_property_info(params)
    @comm = Comm.new(comm_params)
    @comm.cinfo = ActiveSupport::JSON.encode(@pin)
    
    respond_to do |format|
      if @comm.save
        format.html { redirect_to @comm, notice: 'Comm was successfully created.' }
        format.json { render action: 'show', status: :created, location: @comm }
      else
        format.html { render action: 'new' }
        format.json { render json: @comm.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comms/1
  # PATCH/PUT /comms/1.json
  def update

    @pin = fill_property_info(params)
    @comm.cinfo = ActiveSupport::JSON.encode(@pin)
    
    respond_to do |format|
      if @comm.update(comm_params)
        format.html { redirect_to @comm, notice: 'Comm was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @comm.errors, status: :unprocessable_entity }
      end
    end
  end

  def preview_page
    if params[:comm_id]
     @comm =  Comm.find(params[:comm_id])
   end
    @comm.cinfo ||= "{}"
    @pin = ActiveSupport::JSON.decode(@comm.cinfo)
    action = params[:page] || "index"
    render "t1/#{action}" ,layout:false
  end
  # DELETE /comms/1
  # DELETE /comms/1.json
  def destroy
    @comm.destroy
    respond_to do |format|
      format.html { redirect_to comms_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comm
      @comm = Comm.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comm_params
      params.require(:comm).permit(:name)
    end
end
