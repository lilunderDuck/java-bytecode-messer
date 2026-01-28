.PHONY: build

GO_BUILD_FLAGS = -ldflags="-s -w -buildid=" -trimpath

build:
	go build ${GO_BUILD_FLAGS} -o ./build/main.exe ./src/main.go

put_in_fire: build
	cd ./sample && ./gradlew build
	./build/main.exe
	java -jar ./sample/app/build/libs/app.jar sample.App