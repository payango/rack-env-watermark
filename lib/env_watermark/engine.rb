module EnvWatermark
  class Engine < ::Rails::Engine

    initializer 'Watermark for Env' do |app|
      app.middleware.use EnvWatermark

    end

  end
end