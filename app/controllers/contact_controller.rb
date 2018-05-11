class ContactController < MainController
  def index
  end

  def submit

    if Mailer.deliver_contact_email(params['email'], params['message'])
      flash[:notice] = "Ваше сообщение отправлено успешно."
      redirect_to :action => :index
    end


  end

end
