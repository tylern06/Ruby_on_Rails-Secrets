require 'rails_helper'
RSpec.describe 'editing user' do
  it 'displays prepopulated form' do
  	# calls create_user from spec_helper
    user = create_user
    log_in user
    click_link 'Edit Profile'
    expect(page).to have_field('Email')
    expect(page).to have_field('Name')
  end
end