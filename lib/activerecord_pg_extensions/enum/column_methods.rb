module ActiveRecordPgExtensions
  module Enum
    module ColumnMethods
      def enum(*args, **options)
        args.each { |name| column(name, options[:type], options) }
      end
    end
  end
end

ActiveRecord::ConnectionAdapters::PostgreSQL::TableDefinition.include(ActiveRecordPgExtensions::Enum::ColumnMethods)
ActiveRecord::ConnectionAdapters::PostgreSQL::Table.include(ActiveRecordPgExtensions::Enum::ColumnMethods)
