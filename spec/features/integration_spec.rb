require 'spec_helper'
include UsersSpecHelper

describe "Login Integration", js: true do

    before :each do
      sign_in_user
    end

  describe "Signing In" do
    it "logs user in" do
      current_path.should eq '/'
    end
  end

  describe "Community Navigation" do
    it "links to correct url" do
      click_link "Community"
      click_link "Networking"
      current_path.should eq '/networking'
    end

    it "contains correct content" do
      click_link "Community"
      click_link "Networking"
      current_path.should eq '/networking'

      within 'ul.secondary-components' do
        find('h3', text: "Resources")
        all(:css, 'a.see-all')[2].click
      end

      page.should have_content "Seven Habits of Highly Successful MSPs"
    end

    it "filters content" do
      click_link "Community"
      click_link "Networking"
      current_path.should eq '/networking'

      within 'div#content' do
        first('a.see-all').click
      end

      current_path.should eq '/networking/topics'
      find('.sui-dropdown-toggle', text: "Popular").should be_visible

      within 'ul.nav.nav-tabs' do
        find('a', text: "Groups").click
      end

      current_path.should eq '/networking/groups'
      page.should have_content "Cisco"

      within 'ul.nav.nav-tabs' do
        find('a', text: "Resources").click
      end

      current_path.should eq '/networking/resources'
      screenshot_and_open_image

      within all(:css, 'div.component.has-rating')[1] do
        find('img').should be_visible
      end
    end

  end
end




