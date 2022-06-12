class Admin::ContactContactsController < ApplicationController


   def show
     
     @contactsPair = ContactContact.find(params[:id])
   end
end
