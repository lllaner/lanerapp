module MyAttrAccessor

  def strong_attr_accessor(name, type)
    attr_reader name
    var_name = "@#{name}".to_sym
    define_method("#{name}=".to_sym) do |value|
      instance_variable_set(var_name, value) if value.class == type
    end 
  end

  def attr_accessor_with_history(*names)
    names.each do |name|
      var_name = "@#{name}".to_sym
      var_name_history = "@#{name}_history".to_sym

      attr_reader name, "#{name}_history"

      define_method("#{name}=".to_sym) do |value|
        if instance_variable_get(var_name_history)
          instance_variable_get(var_name_history) << instance_variable_get(var_name)
        else
          instance_variable_set(var_name_history, [])
        end
        instance_variable_set(var_name, value)
      end
    end
  end
end
