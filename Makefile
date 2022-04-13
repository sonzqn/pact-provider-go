include ./make/config.mk

install:
	@if [ ! -d pact/bin ]; then\
		echo "--- Installing Pact CLI dependencies";\
		curl -fsSL https://raw.githubusercontent.com/pact-foundation/pact-ruby-standalone/master/install.sh | bash;\
    fi

run-provider:
	@go run provider/cmd/usersvc/main.go

provider: export PACT_TEST := true
provider: install
	@echo "--- 🔨Running Provider Pact tests "
	go test -count=1 -tags=integration github.com/sonzqn/pact-provider-go/src -run "TestPactProvider"
