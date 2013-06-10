module HasAttributes
  def self.included(base)
    base.extend ClassMethods
  end

  def initialize(content)
    @content = content
  end

  attr_reader :content

  module ClassMethods
    def attributes(*names)
      names.each { |name| attribute(name,name) }
    end

    def attribute(name,content_key,klass=nil)
      define_method name do
        value = Array(content_key).inject(content) { |hash,key| hash[key] }

        if klass
          if value.is_a?(Array)
            value.map { |content| klass.new(content) }
          else
            klass.new(value)
          end
        else
          value
        end
      end
    end

  end
end
