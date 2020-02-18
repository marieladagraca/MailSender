# Custom serializer for Messages
Rails.application.config.active_job.custom_serializers << MessageSerializer
Rails.application.config.active_job.queue_adapter = :sidekiq
