class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :birth_place_id, :residence_id, :blood_type_id, :birth_date, :age, :profession, :hobby, :text, :gender_id, :picture])
  end
end
