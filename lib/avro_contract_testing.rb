require 'avro_contract_testing/configuration'
module AvroContractTesting
  extend self

  def upload
    files = storage.directories.get(configuration.s3_bucket_name).files
    schema_store = AvroTurf::SchemaStore.new(path: configuration.schemas_path)

    configuration.consumer_schemas.each do |schema_name|
      files.create(
        key: "#{schema_name}/#{configuration.application_name}.avsc",
        body: schema_store.find(schema_name).to_s,
        public: false,
        content_type: 'application/json'
      )
    end
  end

  def storage
    @storage ||= Fog::Storage.new(
      provider: 'AWS',
      aws_access_key_id: configuration.access_key_id,
      aws_secret_access_key: configuration.secret_access_key
    )
  end

  def initialize_vars
    @configuration = Configuration.new
  end

  def configure
    yield @configuration
  end

  def configuration
    @configuration
  end

  initialize_vars
end
