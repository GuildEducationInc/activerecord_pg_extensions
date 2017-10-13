module ActiveRecordPgExtensions
  module Enum
    module ColumnMethods
      def enum(*args, **options)
        args.each { |name| column(name, options[:type], options) }
      end
    end
  end
end
