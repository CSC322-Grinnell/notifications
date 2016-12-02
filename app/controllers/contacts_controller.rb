# ADAM'S NOTE FROM 11/11: 
# Updating contacts does not work the same way updating students works, need to compare to ensure they're the same process
# Controller for the contacts in a class
class ContactsController < ApplicationController
  before_filter :require_user
  #before_filter :require_admin, except: [:create, :index, :show]

  def index
    @contacts = Contact.all
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.Phone_Number.gsub!(/\D/, '') #make the contact phone number only digits, so they can be counted easy
    if @contact.save
      flash[:notice] = 'Contact was successfully created.'
      redirect_to @contact
    else
      flash[:notice] = 'There was a problem creating the contact.'
      render action: :new
    end
  end

def edit
  @contact = Contact.find(params[:id])
end

  def update
    @id = params[:id]
    @contact = Contact.find(params[:id])

    if @contact.update_attributes(params[:contact])
      
      params[:contacts][:phone].to_s.gsub!(/\D/, '')
      @phone_valid = params[:contacts][:phone].to_s.length == 10
      @contact.update_attribute(:Name , params[:contacts][:name])
      @contact.update_attribute(:Email , params[:contacts][:email])
      @contact.update_attribute(:language , params[:contacts][:language])
      @contact.update_attribute(:student_ids, params[:contacts][:student_ids])
      
      if @phone_valid
        @contact.update_attribute(:Phone_Number , params[:contacts][:phone])
      else
        flash[:notice] = "Phone number is invalid."
        return render action: :edit
      end
      flash[:notice] = 'Contact updated successfully'
      redirect_to @contact
    else
      render action: :edit
    end
  end

  def destroy
    Contact.find(params[:id]).destroy
    flash[:notice] = 'Contact deleted.'
    redirect_to '/contacts'
  end
end