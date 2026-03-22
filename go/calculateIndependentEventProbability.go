package main

import (
	"fmt"
	"errors"
)

// CalculateIntersection computes P(A ∩ B) = P(A) * P(B)
func CalculateIntersection(pA, pB float64) (float64, error) {
	// Probability must be between 0 and 1
	if pA < 0 || pA > 1 || pB < 0 || pB > 1 {
		return 0, errors.New("probabilities must be between 0.0 and 1.0")
	}
	return pA * pB, nil
}

// This specific formula only works if Event A does not affect the outcome of Event B. If they are dependent, you would instead need the formula P(A∩B)=P(A)×P(B∣A).
func main() {
	// Example: Probability of rolling a 6 on a die (1/6) 
	// and flipping heads on a coin (1/2)
	pA := 0.1667 // P(A)
	pB := 0.5    // P(B)

	result, err := CalculateIntersection(pA, pB)
	if err != nil {
		fmt.Println("Error:", err)
		return
	}

	fmt.Printf("Probability of A: %.4f\n", pA)
	fmt.Printf("Probability of B: %.4f\n", pB)
	fmt.Printf("Combined Probability P(A ∩ B): %.4f\n", result)
}
