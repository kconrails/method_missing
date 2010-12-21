class Widget
  def method_missing sym, *args
    if sym =~ /^(\w+)=$/
      instance_variable_set "@#{$1}", args[0]
    else
      instance_variable_get "@#{sym}"
    end
  end
end

