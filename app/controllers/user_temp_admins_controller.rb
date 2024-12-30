class UserTempAdminsController < ApplicationController
  before_action :set_user_temp_admin, only: %i[ show edit update destroy ]

  # GET /user_temp_admins or /user_temp_admins.json
  def index
    @user_temp_admins = UserTempAdmin.all
  end

  # GET /user_temp_admins/1 or /user_temp_admins/1.json
  def show
  end

  # GET /user_temp_admins/new
  def new
    @user_temp_admin = UserTempAdmin.new
  end

  # GET /user_temp_admins/1/edit
  def edit
  end

  # POST /user_temp_admins or /user_temp_admins.json
  def create
    @user_temp_admin = UserTempAdmin.new(user_temp_admin_params)
    if @user_temp_admin.save
      @user_temp_admin=User.create(name: @user_temp_admin.name, last_name: @user_temp_admin.last_name, dni_nro:  @user_temp_admin.dni_nro, email:  @user_temp_admin.email, password:  @user_temp_admin.password, role: "administrador", password_confirmation: @user_temp_admin.password_confirmation)
    end
    respond_to do |format|
      if @user_temp_admin.save
        format.html { redirect_to user_admin_listaAdmin_path, notice: "Se ha creado el administrador con exito" }
        format.json { render :show, status: :created, location: @user_temp_admin }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user_temp_admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_temp_admins/1 or /user_temp_admins/1.json
  def update
    respond_to do |format|
      if @user_temp_admin.update(user_temp_admin_params)
        format.html { redirect_to user_temp_admin_url(@user_temp_admin), notice: "User temp admin was successfully updated." }
        format.json { render :show, status: :ok, location: @user_temp_admin }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user_temp_admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_temp_admins/1 or /user_temp_admins/1.json
  def destroy
    @user_temp_admin.destroy

    respond_to do |format|
      format.html { redirect_to user_temp_admins_url, notice: "User temp admin was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_temp_admin
      @user_temp_admin = UserTempAdmin.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_temp_admin_params
      params.require(:user_temp_admin).permit(:name, :last_name, :dni_nro, :email, :password, :password_confirmation)
    end
end
