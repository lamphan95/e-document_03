class ActivitiesController < ApplicationController
  def index
    @search = PublicActivity::Activity.ransack trackable_type_eq:
      Settings.trackable.document, owner_id_eq: current_user.id
    @activities = PublicActivity::Activity.page(params[:page]).per(params[:limit])
      .ransack(trackable_type_eq: Settings.trackable.document, owner_id_eq: current_user.id).result
  end
end
