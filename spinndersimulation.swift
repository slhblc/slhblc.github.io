import SwiftUI

struct ContentView: View {
    @State var colorName = "gray"
    @State var squareColor = Color.gray
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack(spacing: 40) {
                Text("Spinner Simulation")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                
                ZStack {
                    Rectangle()
                        .fill(squareColor)
                        .frame(width: 200, height: 200)
                        .cornerRadius(25)
                    
                    Text(colorName)
                        .font(.title)
                        .foregroundColor(.white)
                }
                
                Button(action: {
                    spin()
                }) {
                    Text("Spin")
                        .frame(width: 120, height: 45)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(15)
                }
            }
        }
    }
    
    func spin() {
        let first = Int.random(in: 1...2)
        if first == 1 {
            let second = Int.random(in: 1...2)
            if second == 1 {
                colorName = "red"
                squareColor = .red
            } else {
                colorName = "purple"
                squareColor = .purple
            }
        } else {
            let third = Int.random(in: 1...2)
            if third == 1 {
                colorName = "blue"
                squareColor = .blue
            } else {
                colorName = "green"
                squareColor = .green
            }
        }
    }
}

#Preview {
    ContentView()
}

