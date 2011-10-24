class Contacto < ActionMailer::Base  
  def send_email(email, nombre, comentario)
    mail(:to => 'promesometro@proetica.org.pe,promesometro@citivox.com', :from => email, :subject => "Haz recibido un comentario de #{nombre}", :body => comentario)
  end
end