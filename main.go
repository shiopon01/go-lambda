package main

import (
	"fmt"

	"github.com/aws/aws-lambda-go/lambda"
)

// Event is structure of arguments
type Event struct {
	Value1 string `json:"key1"`
	Value2 string `json:"key2"`
	Value3 string `json:"key3"`
}

// Response is structure of response
type Response struct {
	TellYou string `json:"Message"`
}

// LambdaHandler ...
func LambdaHandler(event Event) (Response, error) {
	// Your Code

	return Response{
		TellYou: fmt.Sprintf("Hello %s, %s and %s!!",
			event.Value1, event.Value2, event.Value3)}, nil
}

func main() {
	lambda.Start(LambdaHandler)
}
