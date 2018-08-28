package main

import (
	"fmt"

	"github.com/aws/aws-lambda-go/lambda"
)

// Event ...
type Event struct {
	Name string `json:"What is your name?"`
}

// Response ...
type Response struct {
	Message string `json:"Answer:"`
}

// LambdaHandler ...
func LambdaHandler(event Event) (Response, error) {
	return Response{Message: fmt.Sprintf("Hello %s!!", event.Name)}, nil
}

func main() {
	lambda.Start(LambdaHandler)
}
