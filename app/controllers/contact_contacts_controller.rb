class ContactContactsController < ApplicationController

  def show
    @contactsPair = ContactContact.find(params[:id])
    @day = params[:day]
  end
end
