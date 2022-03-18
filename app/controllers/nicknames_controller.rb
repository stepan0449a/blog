class NicknamesController < ApplicationController
  before_action :set_nickname, only: %i[ show edit update destroy ]

  # GET /nicknames or /nicknames.json
  def index
    @nicknames = Nickname.all
  end

  # GET /nicknames/1 or /nicknames/1.json
  def show
  end

  # GET /nicknames/new
  def new
    @nickname = Nickname.new
  end

  # GET /nicknames/1/edit
  def edit
  end

  # POST /nicknames or /nicknames.json
  def create
    @nickname = Nickname.new(nickname_params)

    respond_to do |format|
      if @nickname.save
        format.html { redirect_to nickname_url(@nickname), notice: "Nickname was successfully created." }
        format.json { render :show, status: :created, location: @nickname }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @nickname.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nicknames/1 or /nicknames/1.json
  def update
    respond_to do |format|
      if @nickname.update(nickname_params)
        format.html { redirect_to nickname_url(@nickname), notice: "Nickname was successfully updated." }
        format.json { render :show, status: :ok, location: @nickname }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @nickname.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nicknames/1 or /nicknames/1.json
  def destroy
    @nickname.destroy

    respond_to do |format|
      format.html { redirect_to nicknames_url, notice: "Nickname was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nickname
      @nickname = Nickname.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def nickname_params
      params.require(:nickname).permit(:title, :text)
    end
end
