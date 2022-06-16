class ContactContactsController < ApplicationController

   def show
     @contactsPair = ContactContact.find(params[:id])
     @day = params[:day]
    # @customer = Customer.find(params[:customer_contact_id])

     #@contact = @contact_contact.customer_contact(@contact.created_at.day)
     #@contact_from_en = @contact_contact.admin_contact(@contact.created_at.day)
   end
end
