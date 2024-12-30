class MercadopagoController < ApplicationController
  add_flash_types :danger,:warning, :notice
  def index
    
    # Mercado Pago SDK
    require 'mercadopago'
    # Add Your credentials
    sdk = Mercadopago::SDK.new("APP_USR-860055752107124-110810-a14e7fbbb8040bae8329652c44482833-1234419174")
    
    # Create a preference request
    preference_data = {

      back_urls: {
        success: 'http://127.0.0.1:3000/mercadopago/success',
        failure: 'http://127.0.0.1:3000/mercadopago/failure',
        pending: 'http://127.0.0.1:3000/mercadopago/pending',
      },
      
      items: [
        {
          title: 'Cargar saldo',
          currency_id: "ARS",
          unit_price: 500,
          quantity: current_user.horas
        }
      ]
    }
    preference_response = sdk.preference.create(preference_data)
    preference = preference_response[:response]

    # This value replaces the String "<%= @preference_id %>" in your HTML
    @preference_id = preference['id']
  end

  def show
  end

  def new
  end

  def success
    current_user.saldo=current_user.saldo+(current_user.horas*500) 
    current_user.save
    redirect_to user_usuario_path, notice: "Saldo cargado correctamente"
  end

  def failure
    redirect_to user_usuario_path, danger: "Error al cargar saldo"
  end

  def pending
    redirect_to user_usuario_path, warning: "Carga de saldo pendiente"
  end

end