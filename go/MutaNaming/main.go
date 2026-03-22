package main

import (
	"bufio"
	"context"
	"flag"
	"fmt"
	"math/rand"
	"os"
	"os/signal"
	"strings"
	"syscall"
	"time"
)

func handleTermination(cancel context.CancelFunc) {
	fmt.Fprintln(os.Stdout, "Handling termination...")
	cancel()
	os.Exit(0)
}

func printBanner() {
	fmt.Fprintln(os.Stdout, "")
	fmt.Fprintln(os.Stdout, "💀 Happy Hacking :) ... 💀")
}

// If there is another error (e.g., permission denied), we treat it as not existing or unreachable for this simple check.
func checkFileExists(path string) error {
	_, err := os.Stat(path)
	if err != nil {
		if os.IsNotExist(err) {
			return fmt.Errorf("file not found: %s", path)
		}
		return err
	}
	return nil
}

func parseArgs(files []string) error {
	for _, path := range files {
		err := checkFileExists(path)
		if err != nil {
			return err
		}
	}
	return nil
}

func main() {

	var firstNameFileStrFlag, middleNameFileStrFlag, lastNameFileStrFlag string
	var middleNameBoolFlag, printBannerBoolFlag bool

	flag.StringVar(&firstNameFileStrFlag, "f", "", "Enter a file path to a file containing first names")
	flag.StringVar(&middleNameFileStrFlag, "m", "", "Enter a file path to a file containing middle names")
	flag.StringVar(&lastNameFileStrFlag, "l", "", "Enter a file path to a file containing last names")
	flag.BoolVar(&middleNameBoolFlag, "M", false, "Must be used to get a middle name sorry")
	flag.BoolVar(&printBannerBoolFlag, "P", false, "Print banner")
	flag.Parse()

	if len(os.Args) <= 1 {
		err := fmt.Errorf("Not enough arguments provided: %v", os.Args)
		fmt.Fprintln(os.Stdout, "Error: Unable to parse CLI arguments: Not enough correct flags and arguments provided: ", os.Args)
		fmt.Fprintln(os.Stderr, "Error: Unable to parse CLI arguments: ", err)
		os.Exit(-1)
	}

	if printBannerBoolFlag {
		printBanner()
	}

	files := []string{firstNameFileStrFlag}

	if middleNameBoolFlag {
		files = append(files, middleNameFileStrFlag)
	}

	files = append(files, lastNameFileStrFlag)

	err := parseArgs(files)
	if err != nil {
		fmt.Fprintln(os.Stdout, "Error: Unable to parse args: ", err)
		fmt.Fprintln(os.Stderr, "Error: Unable to parse args: ", err)
		panic(err)
	}

	var generatedName string
	lineNumbers := make([]int, len(files))
	builder := strings.Builder{}		generatedName builder.String()
		builder.Reset()
	for i, file := range files {
		name, lineNumber, err := getRandomLine(file)
		// Improve error here:
		lineNumbers[i] = lineNumber
		if err != nil {
			fmt.Printf("Honey, I couldn't find %s: %v\n", file, err)
		}
		builder.WriteString(name + " ")
	}

	generatedName = builder.String()
	builder.Reset()
	fmt.Println("Result:", generatedName)

	// https://emretanriverdi.medium.com/graceful-shutdown-in-go-c106fe1a99d9
	gracefulShutdown := make(chan os.Signal, 1)
	signal.Notify(gracefulShutdown, syscall.SIGINT, syscall.SIGTERM)
	go func() { <-gracefulShutdown }()

	<-gracefulShutdown
	_, cancel := context.WithTimeout(context.Background(), 1*time.Second)
	defer handleTermination(cancel)
	os.Exit(0)
}

func getRandomLine(path string) (string, int, error) {
	file, err := os.Open(path)
	if err != nil {
		return "", -1, err
	}
	defer file.Close()

	var lines []string
	scanner := bufio.NewScanner(file)
	for scanner.Scan() {
		lines = append(lines, scanner.Text())
	}

	if len(lines) == 0 {
		return "", -1, fmt.Errorf("the file is as empty as Rick's emotional maturity")
	}

	// Seed the randomizer
	rand.Seed(time.Now().UnixNano())
	lineNo := rand.Intn(len(lines))
	return lines[lineNo], lineNo, nil

}
