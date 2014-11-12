class ParentController < ApplicationController

def show
    id = params[:id] # retrieve movie ID from URI route
    @parent = Parent.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    sort = params[:sort] || session[:sort]
    case sort
    when 'name'
      ordering,@name_header = {:order => :name}, 'hilite'
    when 'childName'
      ordering,@childName_header = {:order => :childName}, 'hilite'
    end
    @all_classes = Parent.all_classes
    @selected_classes = params[:classess] || session[:classess] || {}
    
    if @selected_classes == {}
      @selected_classes = Hash[@all_classes.map {|classes| [classes,classes ]}]
    end
    
    if params[:sort] != session[:sort] or params[:classes] != session[:classes]
      session[:sort] = sort
      session[:classes] = @selected_classes
      redirect_to :sort => sort, :classes => @selected_classes and return
    end
    @parents = Parent.find_all_by_parent(@selected_parents.keys, ordering)
  end

  def new
    # default: render 'new' template
  end

  def create
    @parent = Parent.create!(params[:parent])
    flash[:notice] = "#{@parent.name} was successfully created."
    redirect_to parents_path
  end

  def edit
    @parent = Parent.find params[:id]
  end

  def update
    @parent = Parent.find params[:id]
    @parent.update_attributes!(params[:parent])
    flash[:notice] = "#{@parent.name} was successfully updated."
    redirect_to parent_path(@parent)
  end

  def destroy
    @parent = Parent.find(params[:id])
    @parent.destroy
    flash[:notice] = "Parent '#{@parent.title}' deleted."
    redirect_to parents_path
  end

end
