import SwiftUI

struct ContentView: View {
    @State private var counter = 0
    @State private var overflowAlert = false
    @State private var bits = "0000"
    
    var body: some View {
        VStack(spacing: 22) {
            Text("Current Value: \(counter)")
            Text("Binary Form: \(bits)")
            
            HStack {
                ForEach(Array(bits), id: \.self) { char in
                    RoundedRectangle(cornerRadius: 8)
                        .fill(char == "1" ? .blue : .gray)
                        .frame(width: 50, height: 50)
                        .overlay(Text(String(char)).foregroundColor(.white))
                }
            }
            
            HStack {
                Button("Add (+1)") {
                    let previous = counter
                    counter = (counter + 1) % 16
                    
                    let binaryString = String(counter, radix: 2)
                    bits = String(repeating: "0", count: 4 - binaryString.count) + binaryString
                    
                    overflowAlert = (previous == 15 && counter == 0)
                }
                .buttonStyle(.borderedProminent)
                
                Button("Clear (0)") {
                    counter = 0
                    bits = "0000"
                    overflowAlert = false
                }
                .buttonStyle(.bordered)
            }
            
            if overflowAlert {
                Text("⚠️ Counter Overflow")
                    .foregroundColor(.red)
                    .bold()
            }
        }
        .padding()
    }
}

