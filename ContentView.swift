import SwiftUI

struct ContentView: View {
    
    @State private var hour = 10
    @State private var minute = 0
    
    var body: some View {
        ZStack {
            
            
            if hour < 12 {
                Circle()
                    .frame(width: 400, height: 400)
                    .foregroundColor(.yellow)
            } else {
                Circle()
                    .frame(width: 400, height: 400)
                    .foregroundColor(.blue)
            }
            
            
            Circle()
                .frame(width: 20, height: 20)
                .foregroundColor(.black)
            
            
            Rectangle()
                .frame(width: 8, height: 100)
                .foregroundColor(.white)
                .offset(y: -50)
                .rotationEffect(.degrees(Double(hour % 12) * 30 + Double(minute) * 0.5))
            
                       Rectangle()
                .frame(width: 4, height: 140)
                .foregroundColor(.red)
                .offset(y: -70)
                .rotationEffect(.degrees(Double(minute) * 6))
            
            
            Text(String(format: "Hour: %02d:%02d", hour, minute))
                .offset(y: 250)
                .font(.title)
                .bold()
                .foregroundColor(.white)
        }
        .onTapGesture {
            minute += 15
            if minute >= 60 {
                minute = 0
                hour += 1
                if hour >= 24 {
                    hour = 0
                }
            }
        }
    }
}

