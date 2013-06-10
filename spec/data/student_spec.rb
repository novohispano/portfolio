require 'spec_helper'
require 'data/student'

describe Student do
  let(:subject) { Student.all.first }

  its(:name) { should eq "Erin Drummond" }
  its(:email_address) { should eq "e.b.drummond@gmail.com" }
  its(:looking_for) { should eq ['Mentoring', 'Flexible pairing', 'Advancement opportunities' ] }
  its(:locations) { should eq ["Denver", "Portland", "Boulder", "Chicago", "International"] }
  its(:resume) { should eq "http://ebdrummond.com/resume.pdf" }
  its(:references) { should eq ['Katrina Owen', 'Kareem Grant', 'Kyle Suss'] }

  its(:github_url) { should eq 'http://github.com/ebdrummond' }

  describe "code" do
    let(:project) { subject.projects.first }

    it "#title" do
      project.title.should eq "New Leaf Massage"
    end

    it "#description" do
      project.description.should eq "This is an ongoing project I am working on for my sister, a massage therapist.  The MVP for my gSchool project was online booking built from scratch, as well as text message appointment reminders."
    end

    it "#url" do
      project.url.should eq 'http://github.com/ebdrummond/new_leaf'
    end

    it "#what_to_look_for" do
      project.what_to_look_for.should eq ['custom appointment booking', 'Twilio integration', 'AJAX form updates']
    end
  end
end