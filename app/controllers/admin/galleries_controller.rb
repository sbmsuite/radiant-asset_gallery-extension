class Admin::GalleriesController < ApplicationController

  def index
    @galleries = Gallery.find(:all, :order => "name")
  end

  def new
    @gallery = Gallery.new
    render(:action => 'edit')
  end

  def edit
    @gallery = Gallery.find(params[:id])
    render(:action => 'edit')
  end

  def create
    params[:gallery][:user_id] = current_user.id
    @gallery = Gallery.new(params[:gallery])    
    if @gallery.save
      checked = params[:checked]
      checked.each do |id, selected|
        if selected == 1.to_s
          @gallery.gallery_items.create(:asset_id => id)
        end
      end
      flash[:notice] = "Successfully added a new gallery."
      redirect_to(admin_galleries_path)
    else
      flash[:error] = "Validation errors occurred while processing this form. Please take a moment to review the form and correct any input errors before continuing."
      render(:action => 'edit')
    end
  end

  def update
    @gallery = Gallery.find(params[:id])
    if @gallery.update_attributes(params[:gallery])
      @gallery.gallery_items.clear
      checked = params[:checked]
      checked.each do |id, selected|
        if selected == 1.to_s
          if @gallery.gallery_items.exists?(:asset_id => id)
            next
          else
            @gallery.gallery_items.create(:asset_id => id)
          end
        end
      end      
      flash[:notice] = "Successfully updated the gallery details."
      redirect_to(admin_galleries_path)
    else
      flash[:error] = "Validation errors occurred while processing this form. Please take a moment to review the form and correct any input errors before continuing."
      render(:action => 'edit')
    end
  end


  def destroy
    @gallery = Gallery.find(params[:id])
    @gallery.destroy
    flash[:error] = "The gallery was deleted."
    redirect_to(admin_galleries_path)
  end

end
