require 'spec_helper'
require 'data/student'

describe Student do
  let(:subject) { Student.all.find { |student| student.name == "Erin Drummond" } }

  its(:name) { should eq "Erin Drummond" }
  its(:email_address) { should eq "e.b.drummond@gmail.com" }
  its(:looking_for) { should eq  ["Full stack development with a focus on the back end", "Flexible pairing", "Employee growth through mentoring"] }
  its(:resume) { should eq "http://ebdrummond.com/resume.pdf" }
  its(:references) { should eq ['Katrina Owen', 'Kareem Grant', 'Kyle Suss'] }

  its(:github_url) { should eq 'http://github.com/ebdrummond' }

  describe "locations" do
    describe "first location" do
      let(:location) { subject.locations.first }

      it "#name" do
        location.name.should eq "Denver, CO"
      end

      it "#slug" do
        location.slug.should eq "denver-co"
      end

    end

  end

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