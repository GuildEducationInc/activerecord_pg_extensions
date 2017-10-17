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

      def enums(stream)
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

ActiveRecord::SchemaDumper.prepend(ActiveRecordPgExtensions::Enum::SchemaDumper) if defined? ActiveRecord::SchemaDumper
