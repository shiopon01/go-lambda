all: compress

compress:
	GOOS=linux go build hello.go
	zip hello.zip ./hello

deploy:
	aws lambda create-function \
		--function-name go-test2 \
		--memory 128 \
		--runtime go1.x \
		--zip-file ./hello.zip

clean:
	rm hello hello.zip

.PHONY: all build deploy clean
