require 'env_watermark/engine'
require 'nokogiri'

module EnvWatermark

  class EnvWatermark

    VERSION = '0.1.0'

    def initialize(app, klass = Rails.env)
      @app = app
      @klass = klass
    end

    def call(env)
      @status, @headers, @response = @app.call(env)

      if @headers["Content-Type"].include? "text/html"
        doc = Nokogiri::HTML(@response.body)
        doc.xpath("//body").add_class(@klass)
        [@status, @headers, [doc.to_s]]
      else
        [@status, @headers, @response]
      end
    end

  end

end