require "routing"
ActiveSupport::Dependencies.load_file "ape_on_rails_controller.rb"
ActiveSupport::Dependencies.load_file "ape_on_rails_helper.rb"

module ApeOnRails
  module ClassMethods
  end

  module InstanceMethods
  end

  def self.included(base)
    base.send :extend, ClassMethods
  end
end

