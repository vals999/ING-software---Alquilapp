class CarsController < ApplicationController
  before_action :set_car, only: %i[ show edit update destroy ]
  #before_action :is_admin
  # GET /cars or /cars.json
  add_flash_types :danger,:warning,:notice
  
  def index
    @cars = Car.all
  end

  # GET /cars/1 or /cars/1.json
  def show
  end

  # GET /cars/new
  def new
    @car = Car.new
  end

  # GET /cars/1/edit
  def edit
    @car = Car.find(params[:id])
  end

  # POST /cars or /cars.json
  def create
    @car = Car.new(car_params)
    if current_user
      respond_to do |format|
        if @car.save
            format.html { redirect_to cars_path, notice: "El auto fue agregado exitosamente." }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @car.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /cars/1 or /cars/1.json
  def update
      respond_to do |format|
        if @car.update(car_params)
            format.html { redirect_to cars_path, notice: "El auto fue editado exitosamente." }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @car.errors, status: :unprocessable_entity }
        end
      end
  end

  # DELETE /cars/1 or /cars/1.json
  def destroy
    if @car.is_available
      @car.destroy
      respond_to do |format|
        format.html { redirect_to cars_path, notice: "Auto eliminado correctamente." }
        format.json { head :no_content }
      end
    else
      redirect_to cars_path, danger: "No se puede eliminar un auto si se encuentra en uso"
    end
  end
  
  def deleteCar
    @car= Car.find(params[:id])
    if @car.is_available ==true
      @car.destroy
      respond_to do |format|
        format.html { redirect_to cars_path, notice: "Auto eliminado correctamente." }
        format.json { head :no_content }
      end
    else
      redirect_to cars_path, danger: "No se puede eliminar un auto si se encuentra en uso"
    end
  end
  def changeEnable
    @car=Car.find(params[:id])
    if @car.is_available && @car.is_enable
      @car.is_enable=false
      if @car.save
        redirect_to cars_path, notice: "Se ha pausado el auto con exito"
      else
        redirect_to cars_path, danger: "No se puede pausar un auto si se encuentra en uso"
      end
    else 
        @car.is_enable=true
        if @car.save
          redirect_to cars_path, notice: "Se ha activado el auto con exito"
        else
          redirect_to cars_path, danger: "No se puede activar auto"
        end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_car
     @car = Car.find(params[:id])
    end

    def is_admin
       if !(current_user && current_user.role=="administrador")
        redirect_to root_path 
       end
    end
    # Only allow a list of trusted parameters through.
    def car_params
      params.require(:car).permit(:patent, :brand, :model_car, :seats, :transmision, :fuel, :is_available, :is_enable, :color, :car_number, :year_model)
    end
  
end
