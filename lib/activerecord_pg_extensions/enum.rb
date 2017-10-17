# Adds support for PostgreSQL custom enums
# https://www.postgresql.org/docs/9.6/static/datatype-enum.html

require 'active_record/connection_adapters/postgresql_adapter'
require 'activerecord_pg_extensions/enum/schema_dumper'
require 'activerecord_pg_extensions/enum/schema_statements'
require 'activerecord_pg_extensions/enum/column_methods'

module ActiveRecordPgExtensions
  module Enum
    include SchemaStatements

    ENUM_TYPE_QUERY = <<~SQL.freeze
      SELECT t.typname AS enum_name,
              string_agg(e.enumlabel, ' ') AS enum_value
      FROM pg_type t
      JOIN pg_enum e ON t.oid = e.enumtypid
      JOIN pg_catalog.pg_namespace n ON n.oid = t.typnamespace
      WHERE n.nspname = 'public'
      GROUP BY enum_name
    SQL

    def native_database_types
      super.merge(enum: { name: 'enum' })
    end

    # Adds +:array+ option to the default set
    def prepare_column_options(column)
      spec = super
      spec[:type] = "\"#{column.sql_type}\"" if column.type == :enum
      spec[:array] = 'true' if column.array?
      spec
    end

    def enum_types
      query = ENUM_TYPE_QUERY
      res = exec_query(query, 'SCHEMA').cast_values
      res.each do |line|
        line[1] = line[1].split(' ')
      end
      res
    end
  end
end

ActiveRecord::ConnectionAdapters::PostgreSQLAdapter.prepend(ActiveRecordPgExtensions::Enum)
