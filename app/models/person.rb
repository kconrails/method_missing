class Person < ActiveRecord::Base
  class << self
    def method_missing method_name, *args, &block
      case method_name
      when /^map_by_(\w+)$/ then map_by $1, args[0], &block
      when /^each_by(\w+)$/ then each_by $1, args[0], &block
      else super method_name, *args, &block
      end
    end
    
    def map_by attribute, value, &block
      list = self.all(:conditions => {attribute => value})
      list.map(&block)
    end

    def each_by attribute, value, &block
      list = self.all(:conditions => {attribute => value})
      list.each(&block)
    end
  end
end
