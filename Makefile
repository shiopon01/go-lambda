function = go-test
handler = main
role = arn:aws:iam::123456789012:role/myLambdarole

all: compress
compress:
	GOOS=linux go build -o $(handler) $(handler).go
	zip $(handler).zip $(handler)
	rm $(handler)

deploy:
	GOOS=linux go build -o $(handler) $(handler).go
	zip $(handler).zip $(handler)
	rm $(handler)

	aws lambda create-function \
		--function-name $(function) \
		--zip-file fileb://$(handler).zip \
		--role $(role) \
		--memory 128 \
		--handler $(handler) \
		--runtime go1.x

update:
	GOOS=linux go build -o $(handler) $(handler).go
	zip $(handler).zip $(handler)
	rm $(handler)

	aws lambda update-function-code \
		--function-name $(function) \
		--zip-file fileb://$(handler).zip

clean:
	rm -f $(handler) $(handler).zip

.PHONY: all build deploy update clean
