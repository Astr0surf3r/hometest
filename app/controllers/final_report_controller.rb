# frozen_string_literal: true

class FinalReportController < ApplicationController
  def index
    @users = User.all

    @users_attachments = []

    User.all.each do |user|
      user_element = {}

      user_element[:name] = user.name
      user_element[:resume] = retrieve_type_doc(user, 'resume')
      user_element[:cover_letter] = retrieve_type_doc(user, 'cover_letter')
      user_element[:photo] = retrieve_type_doc(user, 'photo')

      @users_attachments << user_element
    end

    render json: @users_attachments
  end
end
