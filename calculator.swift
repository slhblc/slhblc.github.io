import SwiftUI

struct ContentView: View {
    @State private var inputA = ""
    @State private var inputB = ""
    
    var valueA: Double { Double(inputA) ?? 0 }
    var valueB: Double { Double(inputB) ?? 0 }
    
    var body: some View {
        VStack(spacing: 18) {
            Text("Salih's Calculator")
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            TextField("First number", text: $inputA)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.decimalPad)
            
            TextField("Second number", text: $inputB)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.decimalPad)
            
            Divider()
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Sum: \(valueA + valueB, specifier: "%.2f")")
                Text("Difference: \(valueA - valueB, specifier: "%.2f")")
                Text("Product: \(valueA * valueB, specifier: "%.2f")")
                
                if valueB != 0 {
                    Text("Quotient: \(valueA / valueB, specifier: "%.2f")")
                } else {
                    Text("Quotient: Division by zero")
                        .foregroundColor(.white)
                }
            }
            .font(.headline)
            .padding()
            
            Spacer()
        }
        .padding()
    }
}

