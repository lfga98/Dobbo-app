class RegistrationsController < Devise::RegistrationsController
  private

  def sign_up_params
    params.require(:user).permit(:first_name,:last_name,:email,:maternal_surname,:telephone,:password, :password_confirmation,:street,:number,:city,:mun,:country)
  end

end
