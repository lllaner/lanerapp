module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    attr_reader :validates

    def validate(name, *param)
      @validates ||= []
      @validates << { name => param }
    end
  end

  module InstanceMethods
    def validate!
      self.class.validates.each do |validate|
        validate.each do |name, params|
          value = instance_variable_get("@#{name}".to_sym)
          send "validate_#{params[0]}".to_sym, value, params[1]
        end
      end
    end

    def valid?
      validate!
      true
    rescue RuntimeError => e
      puts e.message
      false
    end

    private

    def validate_presence(value, _prams)
      raise "Value can't be empty" if value.nil? || value == ''
    end

    def validate_format(value, param)
      raise "Format must be #{param.inspect}" unless value =~ param
    end

    def validate_type(value, param)
      raise "Type must be #{param}" unless value.is_a? param
    end
  end
end
