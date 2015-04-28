class ImagesController < ApplicationController
  before_action :require_admin!, only: [:destroy]
  before_action :authenticate_user!, except: [:show, :index, :download]
  before_action :set_image, only: [:show, :edit, :update, :destroy, :download, :vote]
  # GET /images
  # GET /images.json
  def index
    @images = Image.unassigned_to_artefact.paginate(page: params[:page])
    @image = Image.new
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @images.map(&:to_jq_image) }
    end
  end

  # GET /images/1
  # GET /images/1.json
  def show
    @current_user = current_user
    @previous = @image.previous
    @next = @image.next
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @image }
    end
  end

  # GET /images/new
  # GET /images/new.json
  def new
    @image = Image.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @image }
    end
  end

  # GET /images/1/edit
  def edit
  end

  # POST /images
  # POST /images.json
  def create
    @image = Image.create(image_params)
    if @image.save
      # send success header
      render json: { message: 'success', fileID: @image.id }, status: 200
    else
      #  you need to send an error header, otherwise Dropzone
      #  will not interpret the response as an error:
      render json: { error: @image.errors.full_messages.join(',') }, status: 400
    end
  end

  # PUT /images/1
  # PUT /images/1.json
  def update
    respond_to do |format|
      if @image.update_attributes(image_params)
        format.html do
          redirect_to @image, notice: 'Image was successfully updated.'
        end
        # format.json { head :no_content }
        format.json do
          render json: { files: [@image.to_jq_upload] },
                 status: :created, location: @image
        end
      else
        format.html { render action: 'edit' }
        format.json do
          render json: @image.errors,
                 status: :unprocessable_entity
        end
      end
    end
  end

  # DELETE /images/1
  # DELETE /images/1.json
  def destroy
    @image.destroy

    respond_to do |format|
      format.html { redirect_to images_url }
      format.json { head :no_content }
    end
  end

  def download
    send_data File.read(@image.image.path),
              filename: @image.image_file_name,
              type: @image.image_content_type,
              disposition: 'attachment' if @image.image
  end

  def vote
    previous_vote = UserVote.where(user_id: current_user.id, asset_id: @image.id).first
    if previous_vote.present?
      if params[:vote] == 'up' && previous_vote.direction == 'down'
        vote_increment = 2
      elsif params[:vote] == 'down' && previous_vote.direction == 'up'
        vote_increment = -2
      else
        vote_increment = 0
      end
      previous_vote.update_attributes!(direction: params[:vote])
    else
      vote_increment = (params[:vote] == 'up' ? 1 : -1)
      UserVote.create!(user_id: current_user.id, asset_id: @image.id, direction: params[:vote])
    end
    new_count = @image.votes + vote_increment
    @image.update_attributes!(votes: new_count)
    redirect_to image_path(@image)
  end

  private

  def set_image
    @image = Image.find(params[:id])
  end

  def image_params
    params.require(:image).permit(:artefact_id, :image)
  end
end
