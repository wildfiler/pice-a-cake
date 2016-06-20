When(/^fill question with answer info$/) do
  @question = {
    title: 'Question 1',
    answer: <<-ANSWER
  First line of the answer
second line of the answer
    ANSWER
  }
  steps <<-STEPS
    When fill "Title" with "#{@question[:title]}"
    And fill "Answer" with "#{question[:answer]}"
  STEPS
end

And(/^I see question on the page$/) do
  step %[see "#{@answer[:title]}"]
  step %[see "#{@answer[:answer]}"]
end

Given(/^two questions exists$/) do
  @questions = create_pair :question
end

Then(/^I see two questions with answers$/) do
  @questions.each do |question|
    @question = question
    step('I see question on the page')
  end
end
