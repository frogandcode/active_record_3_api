require 'active_record_3_api/version'
require 'active_record'

module ActiveRecord3Api
  module QueryMethods
    def from(value)
      scoped :from => value
    end

    def group(args)
      scoped :group => args
    end

    def having(opts)
      scoped :having => opts
    end

    def includes(*args)
      scoped :include => args.flatten
    end

    def joins(*args)
      scoped :joins => args.flatten
    end

    def limit(value)
      scoped :limit => value
    end

    def lock(locks=true)
      scoped :lock => locks
    end

    def offset(value)
      scoped :offset => value
    end

    def order(args)
      scoped :order => args
    end

    def readonly(value=true)
      scoped :readonly => value
    end

    # Could take a block for complete consistency with AR3
    def select(field_or_fields)
      scoped :select => field_or_fields
    end

    def where(opts, *rest)
      case opts
      when Hash
        scoped :conditions => opts
      else
        scoped :conditions => [opts, *rest]
      end
    end
  end
end

module ActiveRecord
  class Base
    extend ActiveRecord3Api::QueryMethods
  end
end