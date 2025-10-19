import SwiftUI

struct ContentView: View {
    @State var hour = 0
    @State var minute = 0
    
    var minuteAngle: Angle { .degrees(Double(minute) * 6) }
    var hourAngle: Angle {
        let base = Double(hour % 12) * 30.0
        let extra = Double(minute) / 2.0
        return .degrees(base + extra)
    }
    var AMPM: String { hour < 12 ? "AM" : "PM" }
    var displayHour: Int {
        let h = hour % 12
        return h == 0 ? 12 : h
    }
    
    var body: some View {
        ZStack {
            (hour < 12 ? Color.orange : Color.blue)
                .clipShape(Circle())
                .frame(width: 400, height: 400)
                .onTapGesture {
                    hour = (hour + 1) % 24
                }
            
            ForEach(1...12, id: \.self) { num in
                let angle = Angle.degrees(Double(num) * 30)
                VStack {
                    Text("\(num)")
                        .font(.title3)
                        .foregroundColor(.white)
                        .bold()
                        .rotationEffect(-angle)
                    Spacer()
                }
                .frame(width: 300, height: 300)
                .rotationEffect(angle)
            }
            
            Rectangle()
                .frame(width: 6, height: 160)
                .foregroundColor(.white)
                .offset(y: -60)
                .rotationEffect(minuteAngle)
            
            Rectangle()
                .frame(width: 10, height: 110)
                .foregroundColor(.white)
                .offset(y: -40)
                .rotationEffect(hourAngle)
            
            Circle()
                .frame(width: 20, height: 20)
                .foregroundColor(.black)
        }
        
        VStack(spacing: 20) {
            Text(String(format: "%02d:%02d %@", displayHour, minute, AMPM))
                .font(.title)
                .bold()
                .foregroundColor(.primary)
            
            HStack(spacing: 22) {
                Button("Hour -") {
                    hour = (hour == 0) ? 23 : hour - 1
                }
                .tint(.blue)
                .buttonStyle(.borderedProminent)
                
                Button("Hour +") {
                    hour = (hour + 1) % 24
                }
                .tint(.green)
                .buttonStyle(.borderedProminent)
            }
            
            HStack(spacing: 22) {
                Button("Minute -") {
                    if minute == 0 {
                        minute = 59
                        hour = (hour == 0) ? 23 : hour - 1
                    } else {
                        minute -= 1
                    }
                }
                .tint(.blue)
                .buttonStyle(.borderedProminent)
                
                Button("Minute +") {
                    if minute == 59 {
                        minute = 0
                        hour = (hour + 1) % 24
                    } else {
                        minute += 1
                    }
                }
                .tint(.green)
                .buttonStyle(.borderedProminent)
            }
            
            Button("Random Hour") {
                hour = Int.random(in: 0..<24)
            }
            .tint(.purple)
            .buttonStyle(.borderedProminent)
        }
        .animation(.easeInOut(duration: 0.7), value: hourAngle)
        .animation(.easeInOut(duration: 0.7), value: minuteAngle)
    }
}

#Preview {
    ContentView()
}
