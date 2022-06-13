class ContactContact < ApplicationRecord
  #belongs_to :customer, class_name: 'Customer', foreign_key: :customer_contact_id
  #belongs_to :admin, class_name: 'Admin', foreign_key: :admin_contact_id


  def admin_contact(day)
    admin_contact_id = ContactContact.find_by(day: day.to_i).admin_contact_id
    Contact.find(admin_contact_id)
  end

  def customer_contact(day)
    customer_contact_id = ContactContact.find_by(day: day.to_i).customer_contact_id
    Contact.find(customer_contact_id)
  end

  def self.check_customer_contact(day, customer)
    contacts_ids = customer.contacts.ids
    contact_contact_ids = ContactContact.where(day: day.to_i).pluck(:customer_contact_id)
    duplicate_ids = contacts_ids & contact_contact_ids
    duplicate_ids.present?
  end
end
