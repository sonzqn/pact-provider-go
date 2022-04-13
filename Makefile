include ./make/config.mk

install:
	@if [ ! -d pact/bin ]; then\
		echo "--- Installing Pact CLI dependencies";\
		curl -fsSL https://raw.githubusercontent.com/pact-foundation/pact-ruby-standalone/master/install.sh | bash;\
    fi

run-consumer:
	@go run consumer/client/cmd/main.go

unit:
	@echo "--- 🔨Running Unit tests "
	go test -tags=unit -count=1 github.com/sonzqn/pact-consumer-go/src -run 'TestClientUnit'

consumer: export PACT_TEST := true
consumer: install
	@echo "--- 🔨Running Consumer Pact tests "
	go test -tags=integration -count=1 github.com/sonzqn/pact-consumer-go/src -run 'TestClientPact'

provider: install
	@echo "--- 🔨Running Provider Pact tests "
	go test -count=1 -tags=integration github.com/pact-foundation/pact-workshop-go/provider -run "TestPactProvider"
