all: build

build: lib.go sub/lib.go
	date +%e-%m-%YT%H-%M-%SZ > .timestamp
	GO111MODULE=on go build -x -v ./... > .log/$$(cat .timestamp)-build.log 2>&1
	tree -L 6 ${HOME}/worspace/pkg > .log/$$(cat .timestamp)-pkg-tree.log
	tree -L 6 ${HOME}/.cache/go-build > .log/$$(cat .timestamp)-build-cache.log
.PHONY: build

clean:
	rm -f ./main
	rm -f go.mod go.sum
	go clean -cache
	go clean -testcache
	go clean -modcache
.PHONY: clean
