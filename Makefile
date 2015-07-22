all: dnsdock container

UNTRACKED_FILES	= $(shell git status --porcelain --untracked-files=no 2>/dev/null)
DIRTY		= $(shell if test "$(UNTRACKED_FILES)" != ""; then echo "-dirty"; fi)
VERSION		= $(shell git describe --tags HEAD)$(DIRTY)

dnsdock: *.go | deps lint
	go build -ldflags "-X main.version $(VERSION)"

deps:
	go get

test: | lint
	go test -v

lint:
	go fmt

container:
	docker build --tag tonistiigi/dnsdock .

.PHONY: deps test lint container
