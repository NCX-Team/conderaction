require 'casting'

module DCI
  module Data
    extend ActiveSupport::Concern

    included do
      include Casting::Client
      delegate_missing_methods
    end

    def as(role)
      if block_given?
        Casting.delegating(self => role) do
          yield(self)
        end
      else
        cast_as(role)
      end
    end
  end
end
