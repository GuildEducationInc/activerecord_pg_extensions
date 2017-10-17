module ActiveRecordPgExtensions
  module Enum
    module SchemaStatements
      def create_enum(name, *values)
        exec_query("CREATE TYPE #{name} AS ENUM (#{values.map { |v| quote(v) }.join(', ')})").tap {
          reload_type_map
        }
      end

      def drop_enum(name)
        exec_query("DROP TYPE #{name}").tap {
          reload_type_map
        }
      end
    end
  end
end
