require 'casting'
require 'active_support'

module DCI
  module Context
    extend ActiveSupport::Concern

    included do
      def self.perform(*args, &block)
        if block_given?
          new.perform(*args, &block)
        else
          new.perform(*args)
        end
      end
    end

    def characterize(*args)
      yield
      args.each do |item|
        item.uncast unless item.nil?
      end
    end
  end
end
