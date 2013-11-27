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

    before :each do
      click_link "Community"
      click_link "Networking"
      current_path.should eq '/networking'
    end

    it "links to correct url" do
    end

    it "contains correct content" do

      within 'ul.secondary-components' do
        find('h3', text: "Resources")
        all(:css, 'a.see-all')[2].click
      end

      page.should have_content "Seven Habits of Highly Successful MSPs"
    end

    it "filters and navigates content" do

      within 'div#content' do
        find('div.list-footer-controls').first('a.see-all').click
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
      page.should have_content "Seven Habits of Highly Successful MSPs"

      within all(:css, 'div.component.has-rating')[1] do
        find('img').should be_visible
      end
    end

  end
end




