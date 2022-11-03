require "application_system_test_case"

class ResearchesTest < ApplicationSystemTestCase
  setup do
    @research = researches(:one)
  end

  test "visiting the index" do
    visit researches_url
    assert_selector "h1", text: "Researches"
  end

  test "should create research" do
    visit researches_url
    click_on "New research"

    fill_in "Journal", with: @research.journal
    fill_in "Number of auther", with: @research.number_of_auther
    fill_in "Patent", with: @research.patent
    fill_in "Title", with: @research.title
    fill_in "User", with: @research.user_id
    fill_in "Year", with: @research.year
    click_on "Create Research"

    assert_text "Research was successfully created"
    click_on "Back"
  end

  test "should update Research" do
    visit research_url(@research)
    click_on "Edit this research", match: :first

    fill_in "Journal", with: @research.journal
    fill_in "Number of auther", with: @research.number_of_auther
    fill_in "Patent", with: @research.patent
    fill_in "Title", with: @research.title
    fill_in "User", with: @research.user_id
    fill_in "Year", with: @research.year
    click_on "Update Research"

    assert_text "Research was successfully updated"
    click_on "Back"
  end

  test "should destroy Research" do
    visit research_url(@research)
    click_on "Destroy this research", match: :first

    assert_text "Research was successfully destroyed"
  end
end
