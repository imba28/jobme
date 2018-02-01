class InvitecodesController < ApplicationController
  before_action :set_invitecode, only: [:show, :edit, :update, :destroy]

  # GET /invitecodes
  # GET /invitecodes.json
  def index
    @invitecodes = Invitecode.all
  end

  # GET /invitecodes/1
  # GET /invitecodes/1.json
  def show
  end

  # GET /invitecodes/new
  def new
    @invitecode = Invitecode.new
  end

  # GET /invitecodes/1/edit
  def edit
  end

  # POST /invitecodes
  # POST /invitecodes.json
  def create
    @invitecode = Invitecode.new(invitecode_params)

    respond_to do |format|
      if @invitecode.save
        format.html { redirect_to @invitecode, notice: 'Invitecode was successfully created.' }
        format.json { render :show, status: :created, location: @invitecode }
      else
        format.html { render :new }
        format.json { render json: @invitecode.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invitecodes/1
  # PATCH/PUT /invitecodes/1.json
  def update
    respond_to do |format|
      if @invitecode.update(invitecode_params)
        format.html { redirect_to @invitecode, notice: 'Invitecode was successfully updated.' }
        format.json { render :show, status: :ok, location: @invitecode }
      else
        format.html { render :edit }
        format.json { render json: @invitecode.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invitecodes/1
  # DELETE /invitecodes/1.json
  def destroy
    @invitecode.destroy
    respond_to do |format|
      format.html { redirect_to invitecodes_url, notice: 'Invitecode was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invitecode
      @invitecode = Invitecode.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invitecode_params
      params.require(:invitecode).permit(:code, :group_id)
    end
end
