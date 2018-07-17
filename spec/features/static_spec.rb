# spec/features/static_spec.rb

require 'rails_helper'

describe 'navigate' do
  describe 'homepage' do
    it 'cant be reached by a non logged user' do
      visit root_path
      expect(current_path).to eq(new_user_session_path)
    end
  end
end
