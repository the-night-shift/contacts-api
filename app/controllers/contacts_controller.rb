class ContactsController < ApplicationController
  def index
    # search_term = params[:search]
    # contacts = Contact.where("first_name LIKE ?", "%#{search_term}%")
    # find all the contacts that have the user id that is the same as mine
    contacts = current_user.contacts
    render json: contacts.as_json
  end

  def create
    contact = Contact.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      middle_name: params[:middle_name],
      bio: params[:bio],
      email: params[:email],
      phone_number: params[:phone_number],
      user_id: current_user.id
    )
    if contact.save
      render json: contact.as_json
    else
      render json: {errors: contact.errors.full_messages}
    end
  end

  def show
    contact = Contact.find(params[:id])
    render json: contact.as_json
  end

  def update
    contact = Contact.find(params[:id])

    contact.first_name = params[:first_name] || contact.first_name
    contact.middle_name = params[:middle_name] || contact.middle_name
    contact.bio = params[:bio] || contact.bio
    contact.last_name = params[:last_name] || contact.last_name
    contact.email = params[:email] || contact.email
    contact.phone_number = params[:phone_number] || contact.phone_number
    if contact.save
      render json: contact.as_json
    else
      render json: {errors: contact.errors.full_messages}
    end
  end

  def destroy
    contact = Contact.find(params[:id])
    contact.destroy
    render json: {message: "Successfully destroyed contact ##{contact.id}"}
  end
end











