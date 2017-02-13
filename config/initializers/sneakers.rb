Sneakers.configure({})
require 'sneakers'
Sneakers.configure  amqp: ENV['RABBITMQ_CONSUMER'],
                    threads: 1,
                    workers: 1

Sneakers.logger.level = Logger::INFO # the default DEBUG is too noisy
