class ContactoController < ApplicationController
  def new
    @contact_form = ContactForm.new
  end
  
  def create
    @contact_form = ContactForm.new params[:contact_form]
    if @contact_form.valid?
      Contacto.send_email(@contact_form.email, @contact_form.nombre, @contact_form.comentario).deliver
      redirect_to :action => :new, :notice => 'Email enviado, pronto recibiras respuesta.'
    else
      render :new
    end
  end
end
