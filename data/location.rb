class Location

  def self.all
    @locations ||= Student.all.map { |student| student.locations }.flatten.uniq { |location| location.name }.sort_by{|l| l.name}
  end

  def initialize(name)
    @name = name
  end

  attr_reader :name

  def slug
    name.downcase.gsub(/,/,'').gsub(/[^a-zA-Z]/,'-')
  end

end