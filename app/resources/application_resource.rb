# frozen_string_literal: true

# :nodoc:
class ApplicationResource < JSONAPI::Resource
  abstract

  def self.readonly_fields
    @readonly_fields ||= []
  end

  def self.readonly(field, options = {})
    readonly_fields << field
    attribute(field, options)
  end

  def self.creatable_fields(_context)
    super - readonly_fields
  end

  def self.updatable_fields(_context)
    super - readonly_fields
  end
end
