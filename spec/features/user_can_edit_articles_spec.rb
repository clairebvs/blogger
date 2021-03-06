require "rails_helper"

describe "user can edit an article" do
  describe "they link from a show page" do
    describe "they fill in an edit field and submit information and goes to the show page"
    it "update an article" do
      article = Article.create!(title: "Title 1", body: "Body 1")

      visit article_path(article)

      click_link "Edit"

      fill_in "article[title]", with: "Different Title"
      fill_in "article[body]", with: "Different Body"
      click_on "Update Article"

      expect(current_path).to eq(article_path(article))
      expect(page).to have_content("Different Title")
      expect(page).to_not have_content("Title 1")
      expect(page).to have_content("Different Body")
      expect(page).to_not have_content("Body 1")
      # expect(page).to have_content("Article #{article.title} Updated!")
    end
  end
end
