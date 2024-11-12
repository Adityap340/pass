#include <iostream>
using namespace std;

int fibonacci_recursive(int n, int& step_count) {
    step_count++;  // Increment step count for each recursive call
    if (n <= 1) {
        return n;
    }
    return (fibonacci_recursive(n - 1, step_count) + fibonacci_recursive(n - 2, step_count));
}

int fibonacci_iterative(int n, int& step_count) {
    step_count = 0;  // Initialize step count to zero for iterative
    if (n <= 1) {
        return n;
    }
    int a = 0, b = 1;
    for (int i = 2; i <= n; i++) {  // Loop starts from 2 and goes up to n
        step_count++;  // Increment step count for each loop iteration
        int temp = b;
        b = a + b;
        a = temp;
    }
    return b;
}

int main() {
    int recursive_steps = 0;
    int iterative_steps = 0;

    int n = 5;  // Fibonacci term to calculate

    // Calculate and print recursive Fibonacci result and step count
    int recursive_result = fibonacci_recursive(n, recursive_steps);
    cout << "Recursive Fibonacci(" << n << "): " << recursive_result 
         << " (steps: " << recursive_steps << ")" << endl;

    // Calculate and print iterative Fibonacci result and step count
    int iterative_result = fibonacci_iterative(n, iterative_steps);
    cout << "Iterative Fibonacci(" << n << "): " << iterative_result 
         << " (steps: " << iterative_steps << ")" << endl;

    return 0;
}
