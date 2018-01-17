class ContactsController < ApplicationController
  def one_contact_method
    contact = Contact.first
    render json: contact.as_json
  end

  def all_contacts_method
    contacts = Contact.all
    render json: contacts.as_json
  end
end











