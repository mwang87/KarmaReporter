require 'dm-migrations'
require 'dm-serializer'
require 'dm-constraints'

DataMapper::Property::String.length(255)

class ReportInstance
    include DataMapper::Resource
    property :id,               Serial
    property :reportreason,     String
    property :filename,         String
end



DataMapper.finalize
ReportInstance.auto_migrate! unless ReportInstance.storage_exists?
DataMapper.auto_upgrade!