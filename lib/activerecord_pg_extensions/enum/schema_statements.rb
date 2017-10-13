module ActiveRecordPgExtensions
  module Enum
    module SchemaStatements
      def create_enum(name, *values)
        execute "CREATE TYPE #{quote(name)} AS ENUM (#{quote(values.map { |v| quote(v) }.join(', '))})"
      end

      def drop_enum(name)
        execute "DROP TYPE #{quote(name)}"
      end
    end
  end
end
