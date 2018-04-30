class ContactsController < Public::Base
  def new
    @contact = Contact.new
  end

  def confirm
    @contact = Contact.new(contact_params)
    if @contact.valid?
      render :action => 'confirm'
    else
      render :action => 'new'
    end
  end

 
  def create
    @contact = Contact.new(contact_params)
    MailSenderMailer.inquiry(@contact).deliver 
         if @contact.save
            redirect_to static_pages_end_path
         else
           render action: 'new'
         end
  end
 
    private
    def contact_params
      params.require(:contact).permit(:email, :name, :message)
    end
end
