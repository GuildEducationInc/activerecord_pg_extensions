module ActiveRecordPgExtensions
  module Enum
    module SchemaDumper
      def dump(stream)
        header(stream)
        extensions(stream)
        enums(stream)
        tables(stream)
        trailer(stream)
        stream
      end

      private

      def prepare_column_options(column)
        spec = super
        spec[:type] = "\"#{column.sql_type}\"" if column.type == :enum
        spec
      end

      def enums(stream)
        @connection.add_enum_types_to_map

        enum_types = @connection.enum_types
        if enum_types.any?
          enum_types.each do |enum_type|
            stream.puts "  create_enum :#{enum_type.first}, :#{enum_type.second.join(', :')}"
          end
          stream.puts
        end
      end
    end
  end
end

ActiveRecord::ConnectionAdapters::SchemaDumper.prepend(ActiveRecordPgExtensions::Enum::SchemaDumper) if defined? ActiveRecord::ConnectionAdapters::SchemaDumper
