export PATH := $(PWD)/pact/bin:$(PATH)
export PATH
export PROVIDER_NAME = provider-go
export CONSUMER_NAME = consumer-go
export PACT_DIR = $(PWD)/pacts
export LOG_DIR = $(PWD)/log
export PACT_BROKER_PROTO = http
export PACT_BROKER_URL = localhost:9292
export PACT_BROKER_USERNAME = pact_workshop
export PACT_BROKER_PASSWORD = pact_workshop