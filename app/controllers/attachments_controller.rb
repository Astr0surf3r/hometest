# frozen_string_literal: true

class AttachmentsController < ApplicationController
  before_action :set_attachment, only: %i[show edit update destroy]

  # GET /attachments or /attachments.json
  def index
    @attachments = Attachment.all
  end

  # GET /attachments/1 or /attachments/1.json
  def show; end

  # GET /attachments/new
  def new
    @attachment = Attachment.new
  end

  # GET /attachments/1/edit
  def edit; end

  # POST /attachments or /attachments.json
  def create
    @attachment = Attachment.new(attachment_params)
    @user = User.find(attachment_params[:user_id].to_i)
    @type_doc = @attachment.type_doc

    respond_to do |format|
      if job_seeker_condition(@user, @type_doc)
        format.html { render :new, status: :unprocessable_entity }
        flash.now[:notice] = "You can't uploading more that 1 resume for a job-seeker that doesn't have email."
      elsif @attachment.save
        format.html { redirect_to attachment_url(@attachment), notice: 'Attachment was successfully created.' }
        format.json { render :show, status: :created, location: @attachment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attachments/1 or /attachments/1.json
  def update
    respond_to do |format|
      if @attachment.update(attachment_params)
        format.html { redirect_to attachment_url(@attachment), notice: 'Attachment was successfully updated.' }
        format.json { render :show, status: :ok, location: @attachment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attachments/1 or /attachments/1.json
  def destroy
    @attachment.destroy

    respond_to do |format|
      format.html { redirect_to attachments_url, notice: 'Attachment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_attachment
    @attachment = Attachment.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def attachment_params
    params.require(:attachment).permit(:title, :user_id, :type_doc, :doc)
  end

  def job_seeker_condition(user, type_doc)
    if type_doc == 'resume'
      if user.role == 'job_seeker' && retrieve_type_doc(user, 'resume') == 1 && user.email == ''
        true
      else
        false
      end
    else
      false
    end
  end
end
