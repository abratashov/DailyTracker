# frozen_string_literal: true

GrapeSwaggerRails.options.app_url = '/'
GrapeSwaggerRails.options.url = 'api/swagger_doc.json'

GrapeSwaggerRails.options.api_auth     = 'bearer'
GrapeSwaggerRails.options.api_key_name = 'Authorization'
GrapeSwaggerRails.options.api_key_type = 'header'

SWAGGER_DOCUMENTATION = {
  doc_version: '1.0.0',
  info: {
    title: 'DailyTracker API',
    description: 'This API allows accessing the DailyTracker functionality'
  },
  security_definitions: {
    jwt: {
      type: 'apiKey',
      name: 'Authorization',
      in: 'header',
      description: 'JWT Authorization header using the Bearer scheme. Example: "Authorization: Bearer {token}"'
    }
  },
  security: [{ jwt: [] }]
}.freeze
