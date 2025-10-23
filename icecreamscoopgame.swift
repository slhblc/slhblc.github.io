import SwiftUI

struct ConeShape: Shape {
    func path(in rect: CGRect) -> Path {
        var p = Path()
        p.move(to: CGPoint(x: rect.midX, y: rect.maxY))
        p.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        p.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        p.closeSubpath()
        return p
    }
}

struct ContentView: View {
    @State private var numberOfScoops = 0
    
    private let flavors: [Color] = [.pink, .mint, .yellow, .brown, .red]
    
    var body: some View {
        VStack(spacing: 25) {
            
            ZStack(alignment: .bottom) {
                
                // Cone
                ConeShape()
                    .fill(.brown)
                    .frame(width: 120, height: 150)
                
                // Scoops stacked on top of cone
                VStack(spacing: -12) {
                    ForEach(0..<numberOfScoops, id: \.self) { index in
                        ZStack {
                            Circle()
                                .fill(flavors[index % flavors.count])
                                .frame(width: 90, height: 90)
                            
                            Text("\(index + 1)")
                                .font(.title2)
                                .bold()
                                .foregroundColor(.white)
                        }
                    }
                }
                .offset(y: -120)
            }
            .animation(.spring(response: 0.4, dampingFraction: 0.7), value: numberOfScoops)
            
            // Controls
            HStack(spacing: 20) {
                Button("Add Scoop ") {
                    if numberOfScoops < 5 {
                        numberOfScoops += 1
                    } else {
                        numberOfScoops = 0
                        print("Too many scoops! The ice cream melted!")
                    }
                }
                
                Button("Reset 🔄") {
                    numberOfScoops = 0
                }
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}
