Sentry.init do |config|
  config.dsn = 'https://61c2bf153bfb47bd89102159f7c03d28@o1144524.ingest.sentry.io/6208627'
  config.breadcrumbs_logger = [:active_support_logger, :http_logger]

  # Set tracesSampleRate to 1.0 to capture 100%
  # of transactions for performance monitoring.
  # We recommend adjusting this value in production
  config.traces_sample_rate = 1.0
  # or
  config.traces_sampler = lambda do |context|
    true
  end
end
