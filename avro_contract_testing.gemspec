Gem::Specification.new do |s|
  s.name        = 'avro_contract_testing'
  s.version     = '0.0.0'
  s.date        = '2019-05-03'
  s.summary     = "Contract testing for avro schemas"
  s.description = "doodle dee dum do"
  s.authors     = ["Tania Abdollahi"]
  s.email       = 'tania.abdollahi@vts.com'
  s.files       = ["lib/avro_contract_testing.rb", "lib/avr_contract_testing/configuration.rb"]
  s.homepage    =
    'http://rubygems.org/gems/hola'
  s.license       = 'MIT'
  s.add_runtime_dependency 'avro_turf'
  s.add_runtime_dependency 'fog-aws'
end
