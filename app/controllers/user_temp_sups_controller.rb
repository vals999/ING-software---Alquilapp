class UserTempSupsController < ApplicationController
  before_action :set_user_temp_sup, only: %i[ show edit update destroy ]
  add_flash_types :notice
  # GET /user_temp_sups or /user_temp_sups.json
  def index
    @user_temp_sups = UserTempSup.all
  end

  # GET /user_temp_sups/1 or /user_temp_sups/1.json
  def show
  end

  # GET /user_temp_sups/new
  def new
    @user_temp_sup = UserTempSup.new
  end

  # GET /user_temp_sups/1/edit
  def edit
  end

  # POST /user_temp_sups or /user_temp_sups.json
  def create
    @user_temp_sup = UserTempSup.new(user_temp_sup_params)
    if @user_temp_sup.save
      @user_temp_sup=User.create(name: @user_temp_sup.name, last_name: @user_temp_sup.last_name, dni_nro:  @user_temp_sup.dni_nro, email:  @user_temp_sup.email, password:  @user_temp_sup.password, role: "supervisor", password_confirmation: @user_temp_sup.password_confirmation)
    end
    respond_to do |format|
      if @user_temp_sup.save
        format.html { redirect_to user_admin_lista_path, notice: "Se ha creado el supervisor con exito" }
        format.json { render :show, status: :created, location: @user_temp_sup }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user_temp_sup.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_temp_sups/1 or /user_temp_sups/1.json
  def update
    respond_to do |format|
      if @user_temp_sup.update(user_temp_sup_params)
        format.html { redirect_to user_temp_sup_url(@user_temp_sup), notice: "User temp sup was successfully updated." }
        format.json { render :show, status: :ok, location: @user_temp_sup }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user_temp_sup.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_temp_sups/1 or /user_temp_sups/1.json
  def destroy
    @user_temp_sup.destroy

    respond_to do |format|
      format.html { redirect_to user_temp_sups_url, notice: "User temp sup was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_temp_sup
      @user_temp_sup = UserTempSup.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_temp_sup_params
      params.require(:user_temp_sup).permit(:name, :last_name, :dni_nro, :email, :password,:password_confirmation)
    end
end
